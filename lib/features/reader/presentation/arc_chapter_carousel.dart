import 'package:flutter/material.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/spatial_tokens.dart';
import '../../../shared/models/novel_detail.dart';

/// Modal Karusel Busur 3D (Arc Carousel) untuk pemilihan bab bergaya pintu portal melengkung
class ArcChapterCarouselSheet extends StatefulWidget {
  const ArcChapterCarouselSheet({
    super.key,
    required this.chapters,
    required this.currentChapterId,
    required this.accentColor,
    required this.onChapterSelected,
  });

  final List<ChapterSummary> chapters;
  final String currentChapterId;
  final Color accentColor;
  final ValueChanged<ChapterSummary> onChapterSelected;

  static Future<void> show(
    BuildContext context, {
    required List<ChapterSummary> chapters,
    required String currentChapterId,
    required Color accentColor,
    required ValueChanged<ChapterSummary> onChapterSelected,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => ArcChapterCarouselSheet(
        chapters: chapters,
        currentChapterId: currentChapterId,
        accentColor: accentColor,
        onChapterSelected: onChapterSelected,
      ),
    );
  }

  @override
  State<ArcChapterCarouselSheet> createState() => _ArcChapterCarouselSheetState();
}

class _ArcChapterCarouselSheetState extends State<ArcChapterCarouselSheet> {
  late final PageController _pageController;
  double _currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    final initialIndex = widget.chapters.indexWhere((c) => c.id == widget.currentChapterId);
    final validIndex = initialIndex != -1 ? initialIndex : 0;
    _currentPage = validIndex.toDouble();
    _pageController = PageController(
      initialPage: validIndex,
      viewportFraction: 0.58,
    );

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0.0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Container(
      height: size.height * 0.62,
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A).withValues(alpha: 0.95),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        border: Border.all(
          color: widget.accentColor.withValues(alpha: 0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.6),
            blurRadius: 30,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          // Header Bar
          Padding(
            padding: const EdgeInsets.fromLTRB(AppSpacing.lg, AppSpacing.md, AppSpacing.lg, AppSpacing.sm),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Portal Bab',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Text(
                      'Pilih portal untuk berpindah bab',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.close_rounded, color: Colors.white70),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.sm),

          // Karusel Busur Portal 3D
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.chapters.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final chapter = widget.chapters[index];
                final diff = index - _currentPage;
                final isCenter = diff.abs() < 0.5;

                // Hitung transformasi kurva busur silinder 3D
                final scale = (1.0 - (diff.abs() * 0.22)).clamp(0.72, 1.05);
                final rotationY = (diff * -0.38).clamp(-0.8, 0.8);
                final translateZ = -(diff.abs() * 120.0);
                final opacity = (1.0 - (diff.abs() * 0.45)).clamp(0.25, 1.0);
                final isCurrentReading = chapter.id == widget.currentChapterId;

                final matrix = Matrix4.identity()
                  ..setEntry(3, 2, 0.0015)
                  ..translateByDouble(0.0, diff.abs() * 18.0, translateZ, 1.0)
                  ..rotateY(rotationY)
                  ..scaleByDouble(scale, scale, 1.0, 1.0);

                return Center(
                  child: Transform(
                    alignment: Alignment.center,
                    transform: matrix,
                    child: Opacity(
                      opacity: opacity,
                      child: GestureDetector(
                        onTap: () {
                          SpatialHaptics.portalEngage();
                          widget.onChapterSelected(chapter);
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 200,
                          height: 280,
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: isCenter
                                  ? [
                                      const Color(0xFF1E293B),
                                      widget.accentColor.withValues(alpha: 0.35),
                                    ]
                                  : [
                                      const Color(0xFF0F172A),
                                      const Color(0xFF1E293B),
                                    ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: isCenter
                                  ? widget.accentColor
                                  : Colors.white.withValues(alpha: 0.15),
                              width: isCenter ? 2.5 : 1.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: isCenter
                                    ? widget.accentColor.withValues(alpha: 0.4)
                                    : Colors.black.withValues(alpha: 0.4),
                                blurRadius: isCenter ? 20 : 10,
                                spreadRadius: isCenter ? 2 : 0,
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              // Ornamen pintu portal
                              Positioned(
                                top: 16,
                                left: 16,
                                right: 16,
                                bottom: 16,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: isCenter
                                          ? widget.accentColor.withValues(alpha: 0.4)
                                          : Colors.white10,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                              ),
                              // Konten Bab
                              Padding(
                                padding: const EdgeInsets.all(AppSpacing.lg),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: isCenter
                                            ? widget.accentColor.withValues(alpha: 0.3)
                                            : Colors.white10,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        'Bab ${chapter.order}',
                                        style: TextStyle(
                                          color: isCenter ? widget.accentColor : Colors.white70,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      chapter.title,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        height: 1.3,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    if (isCurrentReading)
                                      Row(
                                        children: [
                                          Icon(Icons.bookmark_rounded, size: 14, color: widget.accentColor),
                                          const SizedBox(width: 4),
                                          Text(
                                            'Sedang Dibaca',
                                            style: TextStyle(
                                              color: widget.accentColor,
                                              fontSize: 11,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}
