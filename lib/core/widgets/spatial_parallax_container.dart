import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../../features/settings/presentation/settings_controller.dart';

/// Notifier data offset kemiringan spasial (-1.0 s.d 1.0)
class SpatialTiltData {
  const SpatialTiltData({required this.x, required this.y});

  final double x; // Sumbu horizontal
  final double y; // Sumbu vertikal

  static const zero = SpatialTiltData(x: 0, y: 0);
}

/// InheritedWidget untuk menyalurkan tilt spasial ke widget turunan
class SpatialTiltScope extends InheritedWidget {
  const SpatialTiltScope({
    super.key,
    required this.tilt,
    required super.child,
  });

  final SpatialTiltData tilt;

  static SpatialTiltData of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<SpatialTiltScope>();
    return scope?.tilt ?? SpatialTiltData.zero;
  }

  @override
  bool updateShouldNotify(SpatialTiltScope oldWidget) {
    return (oldWidget.tilt.x - tilt.x).abs() > 0.005 ||
        (oldWidget.tilt.y - tilt.y).abs() > 0.005;
  }
}

/// Kontainer paralaks spasial yang merespons giroskop perangkat,
/// kursor pointer (desktop/web), atau osilasi bernapas alami secara prosedural.
class SpatialParallaxContainer extends ConsumerStatefulWidget {
  const SpatialParallaxContainer({
    super.key,
    required this.child,
    this.maxTiltX = 15.0,
    this.maxTiltY = 15.0,
  });

  final Widget child;
  final double maxTiltX;
  final double maxTiltY;

  @override
  ConsumerState<SpatialParallaxContainer> createState() => _SpatialParallaxContainerState();
}

class _SpatialParallaxContainerState extends ConsumerState<SpatialParallaxContainer>
    with SingleTickerProviderStateMixin {
  StreamSubscription<GyroscopeEvent>? _gyroSub;
  double _rawX = 0;
  double _rawY = 0;
  double _smoothX = 0;
  double _smoothY = 0;

  bool _hasSensors = false;
  AnimationController? _ambientBreathingController;

  @override
  void initState() {
    super.initState();
    _initSensors();
  }

  void _initSensors() {
    if (!kIsWeb && (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS)) {
      try {
        _gyroSub = gyroscopeEventStream().listen(
          (event) {
            _hasSensors = true;
            // Integrasi kecepatan sudut giroskop dengan batasan dan decay
            _rawX = (_rawX + event.y * 0.12).clamp(-1.0, 1.0);
            _rawY = (_rawY + event.x * 0.12).clamp(-1.0, 1.0);
            // Decay kembali perlahan ke tengah (spring return)
            _rawX *= 0.94;
            _rawY *= 0.94;

            _applySmoothing();
          },
          onError: (_) {
            _startAmbientBreathing();
          },
          cancelOnError: false,
        );
      } catch (_) {
        _startAmbientBreathing();
      }
    } else {
      _startAmbientBreathing();
    }
  }

  void _startAmbientBreathing() {
    if (_ambientBreathingController != null) return;
    _ambientBreathingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    )..repeat(reverse: true);

    _ambientBreathingController!.addListener(() {
      if (!mounted) return;
      final t = _ambientBreathingController!.value * 2 * math.pi;
      _rawX = math.sin(t) * 0.25;
      _rawY = math.cos(t * 0.7) * 0.2;
      _applySmoothing();
    });
  }

  void _applySmoothing() {
    // Low-pass filter untuk pergerakan mulus tanpa jank
    const alpha = 0.18;
    _smoothX = alpha * _rawX + (1 - alpha) * _smoothX;
    _smoothY = alpha * _rawY + (1 - alpha) * _smoothY;
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _gyroSub?.cancel();
    _ambientBreathingController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPowerSaver = ref.watch(powerSaverControllerProvider).value ?? false;
    final isGyroEnabled = ref.watch(gyroParallaxControllerProvider).value ?? true;

    if (isPowerSaver || !isGyroEnabled) {
      return SpatialTiltScope(
        tilt: SpatialTiltData.zero,
        child: widget.child,
      );
    }

    return MouseRegion(
      onHover: (event) {
        if (!_hasSensors) {
          final size = MediaQuery.sizeOf(context);
          if (size.width > 0 && size.height > 0) {
            _rawX = ((event.localPosition.dx / size.width) - 0.5) * 2;
            _rawY = ((event.localPosition.dy / size.height) - 0.5) * 2;
            _applySmoothing();
          }
        }
      },
      child: SpatialTiltScope(
        tilt: SpatialTiltData(x: _smoothX, y: _smoothY),
        child: widget.child,
      ),
    );
  }
}

/// Widget lapisan yang menggeser dan memutar dirinya sesuai kedalaman sumbu Z.
class SpatialParallaxLayer extends StatelessWidget {
  const SpatialParallaxLayer({
    super.key,
    required this.child,
    required this.depth,
    this.enableRotation = false,
    this.maxOffset = 24.0,
  });

  /// Kedalaman lapisan (-1.0 s.d 1.0).
  /// Nilai negatif: lapisan jauh di belakang, bergeser berlawanan.
  /// Nilai positif: lapisan dekat di depan, bergeser searah.
  final double depth;
  final Widget child;
  final bool enableRotation;
  final double maxOffset;

  @override
  Widget build(BuildContext context) {
    final tilt = SpatialTiltScope.of(context);
    final dx = tilt.x * depth * maxOffset;
    final dy = tilt.y * depth * maxOffset;

    if (!enableRotation) {
      return Transform.translate(
        offset: Offset(dx, dy),
        child: child,
      );
    }

    final matrix = Matrix4.identity()
      ..setEntry(3, 2, 0.0012)
      ..translateByDouble(dx, dy, depth * 10, 1.0)
      ..rotateY(tilt.x * depth * 0.15)
      ..rotateX(-tilt.y * depth * 0.15);

    return Transform(
      alignment: Alignment.center,
      transform: matrix,
      child: child,
    );
  }
}
