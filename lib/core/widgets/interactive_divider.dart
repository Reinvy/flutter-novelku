import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../theme/spatial_tokens.dart';

/// Pembatas bab vektor mikro-interaktif yang bereaksi terhadap sentuhan jari pembaca
/// menghasilkan gelombang riak air (ripple) dan pendaran partikel kinetik.
class InteractiveChapterDivider extends StatefulWidget {
  const InteractiveChapterDivider({
    super.key,
    required this.accentColor,
    this.title,
  });

  final Color accentColor;
  final String? title;

  @override
  State<InteractiveChapterDivider> createState() => _InteractiveChapterDividerState();
}

class _InteractiveChapterDividerState extends State<InteractiveChapterDivider>
    with SingleTickerProviderStateMixin {
  late final AnimationController _rippleController;
  final List<Offset> _touchPoints = [];

  @override
  void initState() {
    super.initState();
    _rippleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _rippleController.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _rippleController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    SpatialHaptics.cardPress();
    setState(() {
      _touchPoints.add(details.localPosition);
      if (_touchPoints.length > 5) _touchPoints.removeAt(0);
    });
    _rippleController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      child: Container(
        height: 64,
        margin: const EdgeInsets.symmetric(vertical: 24),
        child: CustomPaint(
          painter: _DividerPainter(
            accentColor: widget.accentColor,
            progress: _rippleController.value,
            touchPoints: _touchPoints,
            title: widget.title,
          ),
          size: Size.infinite,
        ),
      ),
    );
  }
}

class _DividerPainter extends CustomPainter {
  _DividerPainter({
    required this.accentColor,
    required this.progress,
    required this.touchPoints,
    this.title,
  });

  final Color accentColor;
  final double progress;
  final List<Offset> touchPoints;
  final String? title;

  @override
  void paint(Canvas canvas, Size size) {
    final midY = size.height * 0.5;
    final midX = size.width * 0.5;

    // 1. Gambar Garis Vektor Utama dengan Gradien Transparan di Ujung
    final linePaint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.transparent,
          accentColor.withValues(alpha: 0.5),
          accentColor,
          accentColor.withValues(alpha: 0.5),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(0, midY - 1, size.width, 2))
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    canvas.drawLine(Offset(size.width * 0.1, midY), Offset(size.width * 0.9, midY), linePaint);

    // 2. Gambar Ornamen Berlian / Rune di Tengah
    final diamondPaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(midX, midY - 8)
      ..lineTo(midX + 8, midY)
      ..lineTo(midX, midY + 8)
      ..lineTo(midX - 8, midY)
      ..close();

    canvas.drawPath(path, diamondPaint);

    // Dua titik ornamen samping
    canvas.drawCircle(Offset(midX - 22, midY), 2.5, diamondPaint);
    canvas.drawCircle(Offset(midX + 22, midY), 2.5, diamondPaint);

    // 3. Render Efek Gelombang Riak Air Interaktif Sentuhan
    if (progress > 0 && progress < 1.0) {
      for (final pt in touchPoints) {
        final radius = progress * 60.0;
        final alpha = (1.0 - progress) * 0.7;

        final ripplePaint = Paint()
          ..color = accentColor.withValues(alpha: alpha)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0 * (1.0 - progress);

        canvas.drawCircle(pt, radius, ripplePaint);

        // Partikel percikan energi
        for (int i = 0; i < 6; i++) {
          final angle = (i * math.pi / 3) + (progress * 2);
          final sparkDist = radius * 1.1;
          final sparkX = pt.dx + math.cos(angle) * sparkDist;
          final sparkY = pt.dy + math.sin(angle) * sparkDist;

          final sparkPaint = Paint()
            ..color = Colors.white.withValues(alpha: alpha)
            ..style = PaintingStyle.fill;

          canvas.drawCircle(Offset(sparkX, sparkY), 1.5, sparkPaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DividerPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.accentColor != accentColor ||
        oldDelegate.touchPoints.length != touchPoints.length;
  }
}
