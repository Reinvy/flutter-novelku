import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/error_view.dart';
import '../../../core/widgets/loading_view.dart';
import '../../../shared/models/novel.dart';
import 'spatial_novel_card.dart';

export 'spatial_novel_card.dart';

/// Kompatibilitas mundur: NovelCard sekarang mengarah ke SpatialNovelCard 3D
class NovelCard extends StatelessWidget {
  const NovelCard({super.key, required this.novel, this.width, this.onLongPress});

  final Novel novel;
  final double? width;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return SpatialNovelCard(
      novel: novel,
      width: width,
      onLongPress: onLongPress,
    );
  }
}

/// Grid responsif novel spasial dengan kedalaman 3D
class NovelGrid extends StatelessWidget {
  const NovelGrid({
    super.key,
    required this.novels,
    this.onLoadMore,
    this.scrollController,
    this.onLongPress,
  });

  final List<Novel> novels;
  final VoidCallback? onLoadMore;
  final ScrollController? scrollController;
  final void Function(Novel novel)? onLongPress;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final crossAxisCount = width >= 900 ? 4 : (width >= 600 ? 3 : 2);
    final spacing = AppSpacing.lg;

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (onLoadMore != null &&
            notification.metrics.extentAfter < 250 &&
            notification is ScrollUpdateNotification) {
          onLoadMore!();
        }
        return false;
      },
      child: GridView.builder(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.lg),
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: spacing + 8,
          crossAxisSpacing: spacing,
          childAspectRatio: 0.58,
        ),
        itemCount: novels.length,
        itemBuilder: (context, index) {
          final novel = novels[index];
          return SpatialNovelCard(
            novel: novel,
            onLongPress: onLongPress == null ? null : () => onLongPress!(novel),
          );
        },
      ),
    );
  }
}

/// Penampil utama: loading/error/data.
class NovelListView extends ConsumerWidget {
  const NovelListView({
    super.key,
    required this.provider,
    required this.onRetry,
    this.onLoadMore,
    this.emptyMessage,
  });

  final AsyncValue<List<Novel>> provider;
  final VoidCallback onRetry;
  final VoidCallback? onLoadMore;
  final String? emptyMessage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return provider.when(
      loading: () => const LoadingView(),
      error: (e, _) => ErrorView(message: 'Gagal memuat data', onRetry: onRetry),
      data: (novels) {
        if (novels.isEmpty) {
          return Center(
            child: Text(
              emptyMessage ?? 'Belum ada novel',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          );
        }
        return NovelGrid(novels: novels, onLoadMore: onLoadMore);
      },
    );
  }
}
