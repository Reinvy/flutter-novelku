import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../../core/theme/app_typography.dart';
import '../../../core/theme/spatial_tokens.dart';

/// Widget pembalik halaman 3D spasial fisik (3D Page Turn with Real-Time Curl & Cast Shadows).
class SpatialPageTurnWidget extends StatefulWidget {
  const SpatialPageTurnWidget({
    super.key,
    required this.pages,
    required this.fontSize,
    required this.textColor,
    required this.backgroundColor,
    required this.onPageChanged,
    this.initialPage = 0,
    this.onTapCenter,
  });

  final List<String> pages;
  final double fontSize;
  final Color textColor;
  final Color backgroundColor;
  final ValueChanged<int> onPageChanged;
  final int initialPage;
  final VoidCallback? onTapCenter;

  @override
  State<SpatialPageTurnWidget> createState() => _SpatialPageTurnWidgetState();
}

class _SpatialPageTurnWidgetState extends State<SpatialPageTurnWidget>
    with SingleTickerProviderStateMixin {
  late int _currentPage;
  late final AnimationController _animController;
  double _dragProgress = 0.0; // -1.0 (geser kanan/halaman lalu) s.d 1.0 (geser kiri/halaman berikut)
  bool _isDragging = false;
  int _targetPage = 0;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage.clamp(0, math.max(0, widget.pages.length - 1));
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _animController.addListener(() {
      setState(() {
        _dragProgress = _animController.value;
      });
    });

    _animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (_dragProgress.abs() >= 0.99) {
          setState(() {
            _currentPage = _targetPage;
            _dragProgress = 0.0;
          });
          SpatialHaptics.pageSnap();
          widget.onPageChanged(_currentPage);
        }
      }
    });
  }

  @override
  void didUpdateWidget(covariant SpatialPageTurnWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.pages.length != oldWidget.pages.length) {
      _currentPage = _currentPage.clamp(0, math.max(0, widget.pages.length - 1));
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _onHorizontalDragStart(DragStartDetails details) {
    if (_animController.isAnimating) return;
    _isDragging = true;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    if (!_isDragging) return;
    final width = MediaQuery.sizeOf(context).width;
    if (width <= 0) return;

    final delta = -details.primaryDelta! / (width * 0.85);
    setState(() {
      _dragProgress = (_dragProgress + delta).clamp(-1.0, 1.0);
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    if (!_isDragging) return;
    _isDragging = false;

    final velocity = -details.primaryVelocity! / 1000.0;
    final shouldFlipForward = (_dragProgress > 0.28 || velocity > 0.5) && _currentPage < widget.pages.length - 1;
    final shouldFlipBackward = (_dragProgress < -0.28 || velocity < -0.5) && _currentPage > 0;

    if (shouldFlipForward) {
      _targetPage = _currentPage + 1;
      _animController.duration = const Duration(milliseconds: 280);
      final anim = Tween<double>(begin: _dragProgress, end: 1.0).animate(
        CurvedAnimation(parent: _animController, curve: SpatialCurves.pageCurl),
      );
      anim.addListener(() {
        _dragProgress = anim.value;
      });
      _animController.forward(from: 0.0);
    } else if (shouldFlipBackward) {
      _targetPage = _currentPage - 1;
      _animController.duration = const Duration(milliseconds: 280);
      final anim = Tween<double>(begin: _dragProgress, end: -1.0).animate(
        CurvedAnimation(parent: _animController, curve: SpatialCurves.pageCurl),
      );
      anim.addListener(() {
        _dragProgress = anim.value;
      });
      _animController.forward(from: 0.0);
    } else {
      // Snap kembali ke halaman aktif
      _animController.duration = const Duration(milliseconds: 200);
      final anim = Tween<double>(begin: _dragProgress, end: 0.0).animate(
        CurvedAnimation(parent: _animController, curve: Curves.easeOut),
      );
      anim.addListener(() {
        _dragProgress = anim.value;
      });
      _animController.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.pages.isEmpty) {
      return const SizedBox.shrink();
    }

    final hasNext = _currentPage < widget.pages.length - 1;
    final hasPrev = _currentPage > 0;

    final currentContent = widget.pages[_currentPage];
    final nextContent = hasNext ? widget.pages[_currentPage + 1] : null;
    final prevContent = hasPrev ? widget.pages[_currentPage - 1] : null;

    final absProgress = _dragProgress.abs().clamp(0.0, 1.0);
    final isForward = _dragProgress >= 0;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapUp: (details) {
        final width = MediaQuery.sizeOf(context).width;
        final x = details.localPosition.dx;
        if (x > width * 0.3 && x < width * 0.7) {
          widget.onTapCenter?.call();
        } else if (x >= width * 0.7 && hasNext) {
          // Tap sisi kanan: flip ke depan
          _flipQuick(forward: true);
        } else if (x <= width * 0.3 && hasPrev) {
          // Tap sisi kiri: flip ke belakang
          _flipQuick(forward: false);
        }
      },
      onHorizontalDragStart: _onHorizontalDragStart,
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Halaman di Bawahnya (Underlying Page: target page yang akan terungkap)
          if (isForward && nextContent != null)
            _PageSurface(
              content: nextContent,
              fontSize: widget.fontSize,
              textColor: widget.textColor,
              backgroundColor: widget.backgroundColor,
              pageNumber: _currentPage + 2,
              totalPages: widget.pages.length,
            )
          else if (!isForward && prevContent != null)
            _PageSurface(
              content: prevContent,
              fontSize: widget.fontSize,
              textColor: widget.textColor,
              backgroundColor: widget.backgroundColor,
              pageNumber: _currentPage,
              totalPages: widget.pages.length,
            )
          else
            _PageSurface(
              content: currentContent,
              fontSize: widget.fontSize,
              textColor: widget.textColor,
              backgroundColor: widget.backgroundColor,
              pageNumber: _currentPage + 1,
              totalPages: widget.pages.length,
            ),

          // 2. Bayangan Proyeksi Dinamis ke Halaman Bawah (Dynamic Cast Shadow)
          if (absProgress > 0.02)
            Positioned.fill(
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: isForward ? Alignment.centerRight : Alignment.centerLeft,
                      end: isForward ? Alignment.centerLeft : Alignment.centerRight,
                      colors: [
                        Colors.black.withValues(alpha: (0.45 * absProgress).clamp(0.0, 0.45)),
                        Colors.black.withValues(alpha: (0.15 * absProgress).clamp(0.0, 0.15)),
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.25, 0.8],
                    ),
                  ),
                ),
              ),
            ),

          // 3. Halaman yang Sedang Berputar / Melengkung 3D (3D Turning Page)
          if (absProgress < 0.99)
            Transform(
              alignment: isForward ? Alignment.centerLeft : Alignment.centerRight,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0011)
                ..rotateY(isForward ? -absProgress * (math.pi * 0.58) : absProgress * (math.pi * 0.58)),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _PageSurface(
                    content: currentContent,
                    fontSize: widget.fontSize,
                    textColor: widget.textColor,
                    backgroundColor: widget.backgroundColor,
                    pageNumber: _currentPage + 1,
                    totalPages: widget.pages.length,
                  ),
                  // Lapisan bayangan lipatan halaman (Curl Crease Shadow)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: isForward ? Alignment.centerLeft : Alignment.centerRight,
                          end: isForward ? Alignment.centerRight : Alignment.centerLeft,
                          colors: [
                            Colors.transparent,
                            Colors.black.withValues(alpha: (0.35 * absProgress).clamp(0.0, 0.35)),
                          ],
                          stops: const [0.65, 1.0],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  void _flipQuick({required bool forward}) {
    if (_animController.isAnimating) return;
    if (forward && _currentPage < widget.pages.length - 1) {
      _targetPage = _currentPage + 1;
      _dragProgress = 0.0;
      _animController.duration = const Duration(milliseconds: 300);
      final anim = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animController, curve: SpatialCurves.pageCurl),
      );
      anim.addListener(() {
        _dragProgress = anim.value;
      });
      _animController.forward(from: 0.0);
    } else if (!forward && _currentPage > 0) {
      _targetPage = _currentPage - 1;
      _dragProgress = 0.0;
      _animController.duration = const Duration(milliseconds: 300);
      final anim = Tween<double>(begin: 0.0, end: -1.0).animate(
        CurvedAnimation(parent: _animController, curve: SpatialCurves.pageCurl),
      );
      anim.addListener(() {
        _dragProgress = anim.value;
      });
      _animController.forward(from: 0.0);
    }
  }
}

/// Permukaan fisik sebuah halaman buku tunggal
class _PageSurface extends StatelessWidget {
  const _PageSurface({
    required this.content,
    required this.fontSize,
    required this.textColor,
    required this.backgroundColor,
    required this.pageNumber,
    required this.totalPages,
  });

  final String content;
  final double fontSize;
  final Color textColor;
  final Color backgroundColor;
  final int pageNumber;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.fromLTRB(28, 20, 28, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              content,
              style: AppTypography.reader(fontSize, textColor),
            ),
          ),
          // Penunjuk nomor halaman minimalis
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Center(
              child: Text(
                '$pageNumber / $totalPages',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                  color: textColor.withValues(alpha: 0.4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
