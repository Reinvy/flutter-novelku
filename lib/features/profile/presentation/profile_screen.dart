import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/app_network_image.dart';
import '../../auth/presentation/auth_controller.dart';
import '../../publisher/presentation/publisher_controller.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final user = ref.watch(currentUserProvider);
    final myNovels = ref.watch(myNovelsControllerProvider);

    return Scaffold(
      body: user.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(child: Text('Gagal memuat profil')),
        data: (u) {
          if (u == null) {
            return const Center(child: Text('Silakan masuk'));
          }
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(currentUserProvider);
              ref.invalidate(myNovelsControllerProvider);
            },
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.md),
              children: [
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: [
                    AppNetworkImage(
                      url: u.avatarUrl,
                      width: 72,
                      height: 72,
                      borderRadius: BorderRadius.circular(36),
                      errorIcon: Icons.person_rounded,
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            u.name,
                            style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            u.email,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      tooltip: 'Edit profil',
                      icon: const Icon(Icons.edit_outlined),
                      onPressed: () => context.push(AppRoutes.editProfile),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                Row(
                  children: [
                    Expanded(
                      child: _StatCard(
                        label: 'Novel',
                        value: '${myNovels.value?.length ?? 0}',
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: _StatCard(
                        label: 'Status',
                        value: 'Aktif',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.lg),
                Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.bookmark_border_rounded),
                        title: const Text('Bookmark'),
                        trailing: const Icon(Icons.chevron_right_rounded),
                        onTap: () => context.push(AppRoutes.bookmarks),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.menu_book_rounded),
                        title: const Text('Novelku'),
                        subtitle: Text('${myNovels.value?.length ?? 0} novel'),
                        onTap: () => context.push(AppRoutes.postNovel),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.logout_rounded),
                        title: const Text('Keluar'),
                        textColor: theme.colorScheme.error,
                        iconColor: theme.colorScheme.error,
                        onTap: () async {
                          final confirmed = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Keluar?'),
                              content: const Text('Anda akan keluar dari akun ini.'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context, false),
                                  child: const Text('Batal'),
                                ),
                                FilledButton(
                                  onPressed: () => Navigator.pop(context, true),
                                  child: const Text('Keluar'),
                                ),
                              ],
                            ),
                          );
                          if (confirmed == true) {
                            await ref.read(authControllerProvider.notifier).logout();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        child: Column(
          children: [
            Text(
              value,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
