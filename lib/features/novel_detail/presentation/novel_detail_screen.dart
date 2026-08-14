import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/app_network_image.dart';
import '../../../core/widgets/error_view.dart';
import '../../../core/widgets/loading_view.dart';
import '../../../core/widgets/rating_stars.dart';
import '../../../shared/models/novel_detail.dart';
import '../../auth/presentation/auth_controller.dart';
import '../presentation/novel_detail_controller.dart';

class NovelDetailScreen extends ConsumerWidget {
  const NovelDetailScreen({super.key, required this.novelId});

  final String novelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(novelDetailControllerProvider(novelId));

    return Scaffold(
      body: detail.when(
        loading: () => const LoadingView(),
        error: (e, _) => ErrorView(
          message: 'Gagal memuat novel',
          onRetry: () => ref.read(novelDetailControllerProvider(novelId).notifier).refresh(),
        ),
        data: (novel) => _NovelDetailBody(novel: novel, novelId: novelId),
      ),
    );
  }
}

class _NovelDetailBody extends ConsumerStatefulWidget {
  const _NovelDetailBody({required this.novel, required this.novelId});

  final NovelDetail novel;
  final String novelId;

  @override
  ConsumerState<_NovelDetailBody> createState() => _NovelDetailBodyState();
}

class _NovelDetailBodyState extends ConsumerState<_NovelDetailBody>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(length: 2, vsync: this);

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final novel = widget.novel;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detail Novel'),
          actions: [
            IconButton(
              tooltip: 'Bagikan',
              icon: const Icon(Icons.share_outlined),
              onPressed: () {},
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _Header(novel: novel, novelId: widget.novelId),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSpacing.md),
                    Row(
                      children: [
                        RatingStars(rating: novel.averageRating ?? 0, size: 20),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          novel.averageRating != null
                              ? '${novel.averageRating!.toStringAsFixed(1)} (${novel.ratingCount})'
                              : 'Belum ada rating',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      'Sinopsis',
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      novel.synopsis,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        height: 1.6,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    TabBar(
                      controller: _tabController,
                      tabs: const [
                        Tab(text: 'Bab (0)'),
                        Tab(text: 'Komentar'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: TabBarView(
                controller: _tabController,
                children: [
                  _ChaptersTab(novel: novel),
                  _CommentsTab(novelId: widget.novelId),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: _ActionBar(novel: novel, novelId: widget.novelId),
      ),
    );
  }
}

class _Header extends ConsumerWidget {
  const _Header({required this.novel, required this.novelId});

  final NovelDetail novel;
  final String novelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppNetworkImage(
            url: novel.coverUrl,
            width: 110,
            height: 165,
            borderRadius: BorderRadius.circular(12),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  novel.title,
                  style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 6),
                Text(
                  novel.authorName,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 6),
                _StatusChip(status: novel.status),
                const SizedBox(height: 10),
                Text(
                  '${novel.chapterCount} bab',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCompleted = status == 'COMPLETED';
    final color = isCompleted ? theme.colorScheme.primary : theme.colorScheme.secondary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isCompleted ? 'Selesai' : 'Berlanjut',
        style: theme.textTheme.labelSmall?.copyWith(color: color, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _ChaptersTab extends ConsumerWidget {
  const _ChaptersTab({required this.novel});

  final NovelDetail novel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final chapters = novel.chapters;

    if (chapters.isEmpty) {
      return const EmptyView(
        icon: Icons.article_outlined,
        title: 'Belum ada bab',
        subtitle: 'Penulis belum menambahkan bab',
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: chapters.length,
      itemBuilder: (context, index) {
        final chapter = chapters[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 14,
            backgroundColor: theme.colorScheme.primaryContainer,
            child: Text(
              '${chapter.order}',
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          title: Text(chapter.title, maxLines: 1, overflow: TextOverflow.ellipsis),
          onTap: () => context.push(AppRoutes.reader(novel.id, chapter.id)),
        );
      },
    );
  }
}

class _CommentsTab extends ConsumerWidget {
  const _CommentsTab({required this.novelId});

  final String novelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final comments = ref.watch(commentsControllerProvider(novelId));
    final isLoggedIn = ref.watch(authControllerProvider).value == AuthStatus.authenticated;

    return Column(
      children: [
        if (isLoggedIn) _CommentInput(novelId: novelId),
        Expanded(
          child: comments.when(
            loading: () => const LoadingView(),
            error: (e, _) => ErrorView(
              message: 'Gagal memuat komentar',
              onRetry: () => ref.invalidate(commentsControllerProvider(novelId)),
            ),
            data: (items) {
              if (items.isEmpty) {
                return const EmptyView(
                  icon: Icons.chat_bubble_outline_rounded,
                  title: 'Belum ada komentar',
                  subtitle: 'Jadilah yang pertama berkomentar',
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.all(AppSpacing.md),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final comment = items[index];
                  return _CommentTile(
                    comment: comment,
                    novelId: novelId,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CommentInput extends ConsumerStatefulWidget {
  const _CommentInput({required this.novelId});

  final String novelId;

  @override
  ConsumerState<_CommentInput> createState() => _CommentInputState();
}

class _CommentInputState extends ConsumerState<_CommentInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.sm, AppSpacing.md, 0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              minLines: 1,
              maxLines: 3,
              decoration: const InputDecoration(hintText: 'Tulis komentar…'),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          IconButton.filled(
            icon: const Icon(Icons.send_rounded, size: 20),
            onPressed: () async {
              final text = _controller.text.trim();
              if (text.isEmpty) return;
              await ref.read(commentsControllerProvider(widget.novelId).notifier).add(text);
              _controller.clear();
            },
          ),
        ],
      ),
    );
  }
}

class _CommentTile extends ConsumerWidget {
  const _CommentTile({required this.comment, required this.novelId});

  final dynamic comment;
  final String novelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final c = comment as dynamic;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppNetworkImage(
            url: c.user?.avatarUrl as String?,
            width: 36,
            height: 36,
            borderRadius: BorderRadius.circular(18),
            errorIcon: Icons.person_rounded,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  c.user?.name as String? ?? 'User',
                  style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 2),
                Text(c.content as String, style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionBar extends ConsumerWidget {
  const _ActionBar({required this.novel, required this.novelId});

  final NovelDetail novel;
  final String novelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(ratingControllerProvider(novelId));

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.sm, AppSpacing.md, AppSpacing.sm),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                icon: Icon(novel.inLibrary == true ? Icons.check_rounded : Icons.add_rounded),
                label: Text(novel.inLibrary == true ? 'Di Pustaka' : 'Pustaka'),
                onPressed: () => ref.read(novelDetailControllerProvider(novelId).notifier).toggleLibrary(),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              flex: 2,
              child: FilledButton.icon(
                icon: const Icon(Icons.play_arrow_rounded),
                label: Text(novel.chapters.isEmpty ? 'Belum Ada Bab' : 'Baca Sekarang'),
                onPressed: novel.chapters.isEmpty
                    ? null
                    : () => context.push(AppRoutes.reader(novelId, novel.chapters.first.id)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
