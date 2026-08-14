import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/app_confirm_dialog.dart';
import '../../../core/widgets/error_view.dart';
import '../../../core/widgets/loading_view.dart';
import '../../explore/presentation/novel_card.dart';
import '../presentation/library_controller.dart';

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final novels = ref.watch(libraryControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perpustakaan',
          style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            tooltip: 'Muat ulang',
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => ref.read(libraryControllerProvider.notifier).refresh(),
          ),
        ],
      ),
      body: novels.when(
        loading: () => const LoadingView(),
        error: (e, _) => ErrorView(
          message: 'Gagal memuat perpustakaan',
          onRetry: () => ref.read(libraryControllerProvider.notifier).refresh(),
        ),
        data: (items) {
          if (items.isEmpty) {
            return const EmptyView(
              icon: Icons.collections_bookmark_outlined,
              title: 'Perpustakaan masih kosong',
              subtitle: 'Tambahkan novel favoritmu dari halaman Jelajah',
            );
          }
          return NovelGrid(
            novels: items,
            onLongPress: (novel) async {
              final confirmed = await showAppConfirmDialog(
                context,
                title: 'Hapus dari perpustakaan',
                message: 'Hapus "${novel.title}" dari perpustakaan?',
                confirmLabel: 'Hapus',
              );
              if (confirmed) {
                await ref.read(libraryControllerProvider.notifier).removeFromLibrary(novel.id);
              }
            },
          );
        },
      ),
    );
  }
}
