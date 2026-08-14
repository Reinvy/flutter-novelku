import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/spatial_tokens.dart';
import '../../features/settings/presentation/settings_controller.dart';

/// Canvas pendaran pencahayaan ambient dinamis (edge-glow) yang mengelilingi viewport membaca.
/// Melakukan crossfade warna halus selama 2–3 detik saat nada/suasana paragraf berubah.
class DynamicAmbientGlow extends ConsumerStatefulWidget {
  const DynamicAmbientGlow({
    super.key,
    required this.mood,
    required this.child,
  });

  final ContentMood mood;
  final Widget child;

  @override
  ConsumerState<DynamicAmbientGlow> createState() => _DynamicAmbientGlowState();
}

class _DynamicAmbientGlowState extends ConsumerState<DynamicAmbientGlow>
    with SingleTickerProviderStateMixin {
  late final AnimationController _colorController;
  late Animation<Color?> _colorAnimation;

  Color _prevColor = MoodLightingProfile.profiles[ContentMood.neutral]!.glowColor;
  Color _targetColor = MoodLightingProfile.profiles[ContentMood.neutral]!.glowColor;

  @override
  void initState() {
    super.initState();
    _colorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    );

    _targetColor = MoodLightingProfile.profiles[widget.mood]?.glowColor ??
        MoodLightingProfile.profiles[ContentMood.neutral]!.glowColor;

    _colorAnimation = ColorTween(begin: _targetColor, end: _targetColor).animate(
      CurvedAnimation(parent: _colorController, curve: SpatialCurves.ambientCrossfade),
    );
  }

  @override
  void didUpdateWidget(covariant DynamicAmbientGlow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.mood != widget.mood) {
      _prevColor = _colorAnimation.value ?? _targetColor;
      _targetColor = MoodLightingProfile.profiles[widget.mood]?.glowColor ??
          MoodLightingProfile.profiles[ContentMood.neutral]!.glowColor;

      _colorAnimation = ColorTween(begin: _prevColor, end: _targetColor).animate(
        CurvedAnimation(parent: _colorController, curve: SpatialCurves.ambientCrossfade),
      );

      _colorController.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPowerSaver = ref.watch(powerSaverControllerProvider).value ?? false;
    final isGlowEnabled = ref.watch(ambientGlowControllerProvider).value ?? true;

    if (isPowerSaver || !isGlowEnabled) {
      return widget.child;
    }

    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        final currentColor = _colorAnimation.value ?? _targetColor;

        return Stack(
          fit: StackFit.expand,
          children: [
            // Kanvas Edge Glow sekeliling layar
            RepaintBoundary(
              child: CustomPaint(
                painter: _AmbientGlowPainter(glowColor: currentColor),
                size: Size.infinite,
              ),
            ),
            // Konten Teks Membaca
            widget.child,
          ],
        );
      },
    );
  }
}

class _AmbientGlowPainter extends CustomPainter {
  _AmbientGlowPainter({required this.glowColor});

  final Color glowColor;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    // Pendaran radial lembut dari tepi ke dalam
    final glowPaint = Paint()
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: 1.1,
        colors: [
          Colors.transparent,
          glowColor.withValues(alpha: glowColor.a * 0.4),
          glowColor,
        ],
        stops: const [0.65, 0.9, 1.0],
      ).createShader(rect);

    canvas.drawRect(rect, glowPaint);
  }

  @override
  bool shouldRepaint(covariant _AmbientGlowPainter oldDelegate) {
    return oldDelegate.glowColor != glowColor;
  }
}
