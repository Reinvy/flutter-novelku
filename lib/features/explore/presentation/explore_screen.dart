import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/error_view.dart';
import '../../../core/widgets/loading_view.dart';
import 'explore_controller.dart';
import 'novel_card.dart';

class ExploreScreen extends ConsumerStatefulWidget {
  const ExploreScreen({super.key});

  @override
  ConsumerState<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends ConsumerState<ExploreScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.extentAfter < 200) {
        ref.read(exploreControllerProvider.notifier).loadMore();
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final novels = ref.watch(exploreControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Jelajah',
          style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            tooltip: 'Cari',
            icon: const Icon(Icons.search_rounded),
            onPressed: () => _showSearchDialog(),
          ),
          IconButton(
            tooltip: 'Urutkan',
            icon: const Icon(Icons.sort_rounded),
            onPressed: () => _showSortMenu(),
          ),
          IconButton(
            tooltip: 'Muat ulang',
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => ref.read(exploreControllerProvider.notifier).refresh(),
          ),
        ],
      ),
      body: novels.when(
        loading: () => const LoadingView(),
        error: (e, _) => ErrorView(
          message: 'Gagal memuat novel',
          onRetry: () => ref.read(exploreControllerProvider.notifier).refresh(),
        ),
        data: (items) {
          if (items.isEmpty) {
            return const EmptyView(
              icon: Icons.menu_book_rounded,
              title: 'Belum ada novel',
              subtitle: 'Jelajahi kembali nanti atau ubah pencarian',
            );
          }
          return NovelGrid(novels: items, scrollController: _scrollController);
        },
      ),
    );
  }

  Future<void> _showSearchDialog() async {
    final query = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cari novel'),
        content: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Judul, sinopsis, penulis…',
            prefixIcon: Icon(Icons.search_rounded),
          ),
          onSubmitted: (v) => Navigator.pop(context, v),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Batal')),
          FilledButton(
            onPressed: () => Navigator.pop(context, _searchController.text),
            child: const Text('Cari'),
          ),
        ],
      ),
    );
    if (query != null) {
      await ref.read(exploreControllerProvider.notifier).search(query);
    }
  }

  Future<void> _showSortMenu() async {
    final notifier = ref.read(exploreControllerProvider.notifier);
    final sort = await showModalBottomSheet<String>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(AppSpacing.md),
              child: Text('Urutkan', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
            ),
            ListTile(
              leading: const Icon(Icons.schedule_rounded),
              title: const Text('Terbaru'),
              onTap: () => Navigator.pop(context, 'newest'),
            ),
            ListTile(
              leading: const Icon(Icons.star_rounded),
              title: const Text('Rating tertinggi'),
              onTap: () => Navigator.pop(context, 'rating'),
            ),
            ListTile(
              leading: const Icon(Icons.sort_by_alpha_rounded),
              title: const Text('Judul A–Z'),
              onTap: () => Navigator.pop(context, 'title'),
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
        ),
      ),
    );
    if (sort != null) {
      await notifier.setSort(sort);
    }
  }
}
