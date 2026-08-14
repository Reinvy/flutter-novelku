import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/spatial_tokens.dart';
import '../../../core/widgets/app_network_image.dart';
import '../../../core/widgets/dimensional_portal_route.dart';
import '../../../core/widgets/spatial_parallax_container.dart';
import '../../../shared/models/novel.dart';
import '../../novel_detail/presentation/novel_detail_screen.dart';

/// Kartu novel 3D spasial dengan ketebalan fisik (extrusion),
/// bayangan dinamis, efek tilt paralaks, dan animasi tekan pendaran (edge glow).
class SpatialNovelCard extends ConsumerStatefulWidget {
  const SpatialNovelCard({
    super.key,
    required this.novel,
    this.width,
    this.onLongPress,
  });

  final Novel novel;
  final double? width;
  final VoidCallback? onLongPress;

  @override
  ConsumerState<SpatialNovelCard> createState() => _SpatialNovelCardState();
}

class _SpatialNovelCardState extends ConsumerState<SpatialNovelCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pressController;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _pressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _pressController, curve: SpatialCurves.springOut),
    );

    _glowAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _pressController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _pressController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    SpatialHaptics.cardPress();
    _pressController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    _pressController.reverse();
    _navigateToDetail();
  }

  void _handleTapCancel() {
    _pressController.reverse();
  }

  void _navigateToDetail() {
    final genreConfig = GenreVisualConfig.fromGenreString(widget.novel.synopsis);
    Navigator.of(context).push(
      DimensionalPortalRoute(
        portalColor: genreConfig.accentGlow,
        builder: (context) => NovelDetailScreen(novelId: widget.novel.id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tilt = SpatialTiltScope.of(context);
    final genreConfig = GenreVisualConfig.fromGenreString(widget.novel.synopsis);

    // Hitung pergeseran bayangan berdasarkan tilt
    final shadowDx = -tilt.x * 12.0;
    final shadowDy = (-tilt.y * 12.0) + 8.0;

    return AnimatedBuilder(
      animation: _pressController,
      builder: (context, child) {
        final scale = _scaleAnimation.value;
        final glow = _glowAnimation.value;

        // Transformasi matriks 3D dengan perspektif
        final cardMatrix = Matrix4.identity()
          ..setEntry(3, 2, 0.0012)
          ..translateByDouble(tilt.x * 6.0, tilt.y * 6.0, (scale - 1.0) * 100, 1.0)
          ..rotateY(tilt.x * 0.12)
          ..rotateX(-tilt.y * 0.12)
          ..scaleByDouble(scale, scale, 1.0, 1.0);

        return GestureDetector(
          onTapDown: _handleTapDown,
          onTapUp: _handleTapUp,
          onTapCancel: _handleTapCancel,
          onLongPress: widget.onLongPress,
          child: Transform(
            alignment: Alignment.center,
            transform: cardMatrix,
            child: Container(
              width: widget.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                // Bayangan fisik 3D berlapis
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25 + (glow * 0.15)),
                    offset: Offset(shadowDx, shadowDy),
                    blurRadius: 18.0 + (glow * 10.0),
                    spreadRadius: glow * 2.0,
                  ),
                  if (glow > 0)
                    BoxShadow(
                      color: genreConfig.accentGlow.withValues(alpha: glow * 0.5),
                      offset: Offset.zero,
                      blurRadius: 22.0,
                      spreadRadius: 2.0,
                    ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    // Garis tepi 3D (slab border & edge glow)
                    border: Border.all(
                      color: glow > 0
                          ? genreConfig.accentGlow.withValues(alpha: 0.8 * glow)
                          : theme.colorScheme.outlineVariant.withValues(alpha: 0.3),
                      width: glow > 0 ? 2.0 : 1.0,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Area Cover dengan ketebalan fisik 3D
                      Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 2 / 3,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                AppNetworkImage(
                                  url: widget.novel.coverUrl,
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                                ),
                                // Efek kilau cahaya diagonal (3D book sheen)
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.white.withValues(alpha: 0.12),
                                          Colors.transparent,
                                          Colors.black.withValues(alpha: 0.35),
                                        ],
                                        stops: const [0.0, 0.45, 1.0],
                                      ),
                                    ),
                                  ),
                                ),
                                // Efek ketebalan punggung buku kiri (book spine edge)
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  bottom: 0,
                                  width: 6,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.white.withValues(alpha: 0.3),
                                          Colors.black.withValues(alpha: 0.4),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Badge Genre
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.65),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: genreConfig.accentGlow.withValues(alpha: 0.6),
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                genreConfig.name,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Info Judul & Meta
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.novel.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                                height: 1.25,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(Icons.star_rounded, size: 14, color: Colors.amber.shade600),
                                const SizedBox(width: 2),
                                Text(
                                  widget.novel.averageRating?.toStringAsFixed(1) ?? '—',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Icon(Icons.auto_stories_rounded, size: 12, color: theme.colorScheme.onSurfaceVariant),
                                const SizedBox(width: 3),
                                Text(
                                  '${widget.novel.chapterCount}',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    fontSize: 11,
                                    color: theme.colorScheme.onSurfaceVariant,
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
    );
  }
}
