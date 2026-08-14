import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme/spatial_tokens.dart';
import '../../features/settings/presentation/settings_controller.dart';

/// Canvas atmosfer genre berkinerja tinggi untuk latar belakang The Story Room.
/// Menghadirkan kabut fantasi, garis grid sci-fi, partikel bokeh romantis, atau bara misteri.
class GenreAtmosphereCanvas extends ConsumerStatefulWidget {
  const GenreAtmosphereCanvas({
    super.key,
    required this.genreConfig,
    this.opacity = 1.0,
  });

  final GenreVisualConfig genreConfig;
  final double opacity;

  @override
  ConsumerState<GenreAtmosphereCanvas> createState() => _GenreAtmosphereCanvasState();
}

class _GenreAtmosphereCanvasState extends ConsumerState<GenreAtmosphereCanvas>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 24),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPowerSaver = ref.watch(powerSaverControllerProvider).value ?? false;

    if (isPowerSaver) {
      return Container(color: widget.genreConfig.ambientBase);
    }

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _GenrePainter(
              type: widget.genreConfig.type,
              progress: _controller.value,
              accentColor: widget.genreConfig.accentGlow,
              secondaryColor: widget.genreConfig.secondaryGlow,
              baseColor: widget.genreConfig.ambientBase,
              opacity: widget.opacity,
            ),
            size: Size.infinite,
          );
        },
      ),
    );
  }
}

class _GenrePainter extends CustomPainter {
  _GenrePainter({
    required this.type,
    required this.progress,
    required this.accentColor,
    required this.secondaryColor,
    required this.baseColor,
    required this.opacity,
  });

  final GenreAtmosphereType type;
  final double progress;
  final Color accentColor;
  final Color secondaryColor;
  final Color baseColor;
  final double opacity;

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Gambar latar belakang dasar
    final bgPaint = Paint()..color = baseColor;
    canvas.drawRect(Offset.zero & size, bgPaint);

    switch (type) {
      case GenreAtmosphereType.fantasy:
        _drawFantasyAtmosphere(canvas, size);
      case GenreAtmosphereType.sciFi:
        _drawSciFiAtmosphere(canvas, size);
      case GenreAtmosphereType.romance:
        _drawRomanceAtmosphere(canvas, size);
      case GenreAtmosphereType.mystery:
        _drawMysteryAtmosphere(canvas, size);
      case GenreAtmosphereType.classic:
        _drawClassicAtmosphere(canvas, size);
    }
  }

  void _drawFantasyAtmosphere(Canvas canvas, Size size) {
    // Kabut fantasi berlapis berkecepatan lambat (ultra-slow moving fog)
    final fogPaint = Paint()
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 55);

    for (int i = 0; i < 3; i++) {
      final layerProgress = (progress + (i * 0.33)) % 1.0;
      final x = (math.sin(layerProgress * 2 * math.pi + i) * size.width * 0.4) + (size.width * 0.5);
      final y = size.height * (0.2 + (i * 0.3)) + (math.cos(layerProgress * 2 * math.pi) * 40);
      final radius = (size.width * 0.45) + (i * 30);

      fogPaint.color = (i.isEven ? accentColor : secondaryColor).withValues(
        alpha: (0.04 + (i * 0.02)) * opacity,
      );

      canvas.drawCircle(Offset(x, y), radius, fogPaint);
    }
  }

  void _drawSciFiAtmosphere(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = accentColor.withValues(alpha: 0.08 * opacity)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    // Grid perspektif cyberpunk
    final horizonY = size.height * 0.75;
    const numLines = 8;
    for (int i = 0; i <= numLines; i++) {
      final x = (size.width / numLines) * i;
      canvas.drawLine(
        Offset(size.width * 0.5, horizonY - 100),
        Offset(x, size.height),
        linePaint,
      );
    }

    // Garis horizontal berdenyut
    final pulseY = (progress * size.height);
    final pulsePaint = Paint()
      ..color = secondaryColor.withValues(alpha: (0.12 * math.sin(progress * math.pi)) * opacity)
      ..strokeWidth = 1.5;
    canvas.drawLine(Offset(0, pulseY), Offset(size.width, pulseY), pulsePaint);
  }

  void _drawRomanceAtmosphere(Canvas canvas, Size size) {
    // Partikel bokeh mengambang dengan gerakan harmonik lembut
    final bokehPaint = Paint()
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 28);

    final randomSeed = [
      [0.2, 0.3, 40.0],
      [0.7, 0.2, 55.0],
      [0.4, 0.6, 65.0],
      [0.85, 0.75, 48.0],
      [0.15, 0.85, 50.0],
    ];

    for (int i = 0; i < randomSeed.length; i++) {
      final item = randomSeed[i];
      final baseX = item[0] * size.width;
      final baseY = item[1] * size.height;
      final radius = item[2];

      final driftX = math.sin((progress * 2 * math.pi) + i) * 25.0;
      final driftY = math.cos((progress * 2 * math.pi) + (i * 1.5)) * 30.0;

      bokehPaint.color = (i % 2 == 0 ? accentColor : secondaryColor).withValues(
        alpha: (0.07 + (i * 0.015)) * opacity,
      );

      canvas.drawCircle(Offset(baseX + driftX, baseY + driftY), radius, bokehPaint);
    }
  }

  void _drawMysteryAtmosphere(Canvas canvas, Size size) {
    // Vignette misterius melingkar
    final vignettePaint = Paint()
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: 0.9,
        colors: [
          Colors.transparent,
          accentColor.withValues(alpha: 0.12 * opacity),
          Colors.black.withValues(alpha: 0.35 * opacity),
        ],
        stops: const [0.3, 0.75, 1.0],
      ).createShader(Offset.zero & size);

    canvas.drawRect(Offset.zero & size, vignettePaint);

    // Bara lembut naik
    final emberPaint = Paint();
    for (int i = 0; i < 6; i++) {
      final emberProg = (progress * (1.2 + (i * 0.2)) + (i * 0.16)) % 1.0;
      final x = (size.width * (0.15 + (i * 0.14))) + (math.sin(emberProg * 4 * math.pi) * 15);
      final y = size.height * (1.0 - emberProg);
      final alpha = math.sin(emberProg * math.pi) * 0.25 * opacity;

      emberPaint.color = accentColor.withValues(alpha: alpha);
      canvas.drawCircle(Offset(x, y), 2.5, emberPaint);
    }
  }

  void _drawClassicAtmosphere(Canvas canvas, Size size) {
    // Pendaran hangat minimalis
    final gradPaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(0.0, -0.4),
        radius: 1.1,
        colors: [
          accentColor.withValues(alpha: 0.05 * opacity),
          Colors.transparent,
        ],
      ).createShader(Offset.zero & size);

    canvas.drawRect(Offset.zero & size, gradPaint);
  }

  @override
  bool shouldRepaint(covariant _GenrePainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.type != type ||
        oldDelegate.opacity != opacity;
  }
}
