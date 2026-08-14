import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/app_network_image.dart';
import '../../../core/widgets/error_view.dart';
import '../../../core/widgets/loading_view.dart';
import '../../../shared/models/reading_history.dart';
import '../presentation/history_controller.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final history = ref.watch(historyControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Riwayat Baca',
          style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            tooltip: 'Muat ulang',
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => ref.read(historyControllerProvider.notifier).refresh(),
          ),
        ],
      ),
      body: history.when(
        loading: () => const LoadingView(),
        error: (e, _) => ErrorView(
          message: 'Gagal memuat riwayat',
          onRetry: () => ref.read(historyControllerProvider.notifier).refresh(),
        ),
        data: (items) {
          if (items.isEmpty) {
            return const EmptyView(
              icon: Icons.history_rounded,
              title: 'Belum ada riwayat baca',
              subtitle: 'Novel yang kamu baca akan muncul di sini',
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.md),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
            itemBuilder: (context, index) => _HistoryTile(item: items[index]),
          );
        },
      ),
    );
  }
}

class _HistoryTile extends StatelessWidget {
  const _HistoryTile({required this.item});

  final ReadingHistory item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final novel = item.novel;
    final chapter = item.chapter;

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => context.push(AppRoutes.reader(novel.id, chapter.id)),
        child: Padding(
          padding: AppSpacing.card,
          child: Row(
            children: [
              AppNetworkImage(
                url: novel.coverUrl,
                width: 48,
                height: 68,
                borderRadius: BorderRadius.circular(8),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      novel.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Terakhir: ${chapter.title}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      DateFormat('d MMM yyyy, HH:mm').format(item.updatedAt.toLocal()),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Icon(Icons.chevron_right_rounded, color: theme.colorScheme.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}
