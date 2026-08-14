import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/app_network_image.dart';
import '../../../core/widgets/error_view.dart';
import '../../../core/widgets/loading_view.dart';
import '../../../shared/models/novel.dart';

/// Kartu novel untuk grid Jelajah & Pustaka.
class NovelCard extends StatelessWidget {
  const NovelCard({super.key, required this.novel, this.width});

  final Novel novel;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => context.push(AppRoutes.novelDetail(novel.id)),
      borderRadius: BorderRadius.circular(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 2 / 3,
            child: AppNetworkImage(
              url: novel.coverUrl,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            novel.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              Icon(Icons.star_rounded, size: 14, color: theme.colorScheme.secondary),
              const SizedBox(width: 2),
              Text(
                novel.averageRating?.toStringAsFixed(1) ?? '—',
                style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
              const SizedBox(width: 6),
              Icon(Icons.menu_book_rounded, size: 13, color: theme.colorScheme.onSurfaceVariant),
              const SizedBox(width: 2),
              Text(
                '${novel.chapterCount}',
                style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Grid responsif novel.
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
    final crossAxisCount = width >= 600 ? 4 : 3;
    final spacing = AppSpacing.md;

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (onLoadMore != null &&
            notification.metrics.extentAfter < 200 &&
            notification is ScrollUpdateNotification) {
          onLoadMore!();
        }
        return false;
      },
      child: GridView.builder(
        controller: scrollController,
        padding: const EdgeInsets.all(AppSpacing.md),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: spacing,
          crossAxisSpacing: spacing,
          childAspectRatio: 0.5,
        ),
        itemCount: novels.length,
        itemBuilder: (context, index) => GestureDetector(
          onLongPress: onLongPress == null ? null : () => onLongPress!(novels[index]),
          child: NovelCard(novel: novels[index]),
        ),
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
