import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/app_network_image.dart';
import '../../../core/widgets/error_view.dart';
import '../../../core/widgets/loading_view.dart';
import '../presentation/bookmarks_controller.dart';

class BookmarksScreen extends ConsumerWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final bookmarks = ref.watch(bookmarksControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Bookmark')),
      body: bookmarks.when(
        loading: () => const LoadingView(),
        error: (e, _) => ErrorView(
          message: 'Gagal memuat bookmark',
          onRetry: () => ref.read(bookmarksControllerProvider.notifier).refresh(),
        ),
        data: (items) {
          if (items.isEmpty) {
            return const EmptyView(
              icon: Icons.bookmark_border_rounded,
              title: 'Belum ada bookmark',
              subtitle: 'Bookmark bab favoritmu saat membaca',
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.md),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
            itemBuilder: (context, index) {
              final bookmark = items[index];
              return Card(
                child: ListTile(
                  leading: AppNetworkImage(
                    url: bookmark.novel.coverUrl,
                    width: 40,
                    height: 56,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  title: Text(
                    bookmark.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    bookmark.novel.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.bookmark_rounded, color: theme.colorScheme.primary),
                    onPressed: () => ref.read(bookmarksControllerProvider.notifier).remove(bookmark.id),
                  ),
                  onTap: () => context.push(AppRoutes.reader(bookmark.novel.id, bookmark.id)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
