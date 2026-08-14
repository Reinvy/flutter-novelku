import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/spatial_tokens.dart';

/// Pita kain fisik 3D (Physical Cloth Ribbon) untuk menandai halaman buku.
/// Dapat ditarik ke bawah dari sudut kanan atas layar dengan umpan balik haptik dan animasi pegas.
class PhysicalRibbonBookmark extends StatefulWidget {
  const PhysicalRibbonBookmark({
    super.key,
    required this.isBookmarked,
    required this.onToggleBookmark,
  });

  final bool isBookmarked;
  final VoidCallback onToggleBookmark;

  @override
  State<PhysicalRibbonBookmark> createState() => _PhysicalRibbonBookmarkState();
}

class _PhysicalRibbonBookmarkState extends State<PhysicalRibbonBookmark>
    with SingleTickerProviderStateMixin {
  late final AnimationController _springController;
  double _pullOffset = 0.0;
  bool _isDragging = false;
  static const double _anchorThreshold = 90.0;
  static const double _maxPull = 150.0;

  @override
  void initState() {
    super.initState();
    _springController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
  }

  @override
  void dispose() {
    _springController.dispose();
    super.dispose();
  }

  void _onVerticalDragStart(DragStartDetails details) {
    _isDragging = true;
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    if (!_isDragging) return;
    setState(() {
      _pullOffset = (_pullOffset + details.primaryDelta!).clamp(0.0, _maxPull);
    });
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    if (!_isDragging) return;
    _isDragging = false;

    if (_pullOffset >= _anchorThreshold) {
      SpatialHaptics.ribbonAnchor();
      widget.onToggleBookmark();
    }

    _springController.duration = const Duration(milliseconds: 280);
    final anim = Tween<double>(begin: _pullOffset, end: 0.0).animate(
      CurvedAnimation(parent: _springController, curve: SpatialCurves.springOut),
    );
    anim.addListener(() {
      setState(() {
        _pullOffset = anim.value;
      });
    });
    _springController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    final baseHeight = widget.isBookmarked ? 80.0 : 28.0;
    final totalHeight = baseHeight + _pullOffset;

    return Positioned(
      top: 0,
      right: 28,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onVerticalDragStart: _onVerticalDragStart,
        onVerticalDragUpdate: _onVerticalDragUpdate,
        onVerticalDragEnd: _onVerticalDragEnd,
        child: CustomPaint(
          size: Size(34, totalHeight),
          painter: _RibbonPainter(
            height: totalHeight,
            isBookmarked: widget.isBookmarked,
            pullProgress: (_pullOffset / _maxPull).clamp(0.0, 1.0),
          ),
        ),
      ),
    );
  }
}

class _RibbonPainter extends CustomPainter {
  _RibbonPainter({
    required this.height,
    required this.isBookmarked,
    required this.pullProgress,
  });

  final double height;
  final bool isBookmarked;
  final double pullProgress;

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final notchDepth = 14.0;

    // 1. Proyeksi Bayangan Kain ke Halaman di Bawahnya
    final shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.35 + (pullProgress * 0.2))
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6.0);

    final shadowPath = Path()
      ..moveTo(2, 0)
      ..lineTo(width + 2, 0)
      ..lineTo(width + 2, height + 3)
      ..lineTo((width / 2) + 2, height - notchDepth + 3)
      ..lineTo(2, height + 3)
      ..close();

    canvas.drawPath(shadowPath, shadowPaint);

    // 2. Badan Pita Burgundy Velvet
    final ribbonPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          AppColors.ribbonBurgundy.withValues(alpha: 0.88),
          AppColors.ribbonBurgundy,
          const Color(0xFFA00028),
          AppColors.ribbonBurgundy,
          const Color(0xFF600018),
        ],
        stops: const [0.0, 0.25, 0.5, 0.8, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, width, height));

    final ribbonPath = Path()
      ..moveTo(0, 0)
      ..lineTo(width, 0)
      ..lineTo(width, height)
      ..lineTo(width / 2, height - notchDepth) // Swallowtail notch
      ..lineTo(0, height)
      ..close();

    canvas.drawPath(ribbonPath, ribbonPaint);

    // 3. Trim / Sulaman Benang Emas di Tepian
    final goldTrimPaint = Paint()
      ..color = AppColors.ribbonGold.withValues(alpha: 0.85)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    final trimPath = Path()
      ..moveTo(2.5, 0)
      ..lineTo(2.5, height - 3)
      ..lineTo(width / 2, height - notchDepth - 3)
      ..lineTo(width - 2.5, height - 3)
      ..lineTo(width - 2.5, 0);

    canvas.drawPath(trimPath, goldTrimPaint);

    // 4. Ikon Bookmark Emas jika sedang terpasang / aktif
    if (isBookmarked || pullProgress > 0.4) {
      final iconPaint = Paint()
        ..color = AppColors.ribbonGold
        ..style = PaintingStyle.fill;

      final iconMidX = width / 2;
      final iconY = height * 0.45;

      canvas.drawCircle(Offset(iconMidX, iconY), 3.0, iconPaint);
      canvas.drawCircle(Offset(iconMidX, iconY - 8), 1.8, iconPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _RibbonPainter oldDelegate) {
    return oldDelegate.height != height ||
        oldDelegate.isBookmarked != isBookmarked ||
        oldDelegate.pullProgress != pullProgress;
  }
}
