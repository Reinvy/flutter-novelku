import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/spatial_tokens.dart';
import '../../../core/widgets/app_confirm_dialog.dart';
import '../../../core/widgets/error_view.dart';
import '../../../core/widgets/loading_view.dart';
import '../../../core/widgets/spatial_parallax_container.dart';
import '../../explore/presentation/novel_card.dart';
import '../../settings/presentation/settings_controller.dart';
import 'library_controller.dart';

/// The Atrium — Galeri Spasial 3D Perpustakaan Pribadi
class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final novels = ref.watch(libraryControllerProvider);
    final isPowerSaver = ref.watch(powerSaverControllerProvider).value ?? false;

    return SpatialParallaxContainer(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'The Atrium',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              ),
              Text(
                'Koleksi Spasial Novelmu',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              tooltip: isPowerSaver ? 'Mode Hemat Baterai (Aktif)' : 'Mode Spasial Aktif',
              icon: Icon(
                isPowerSaver ? Icons.bolt_rounded : Icons.auto_awesome_rounded,
                color: isPowerSaver ? Colors.amber : theme.colorScheme.primary,
              ),
              onPressed: () => ref.read(powerSaverControllerProvider.notifier).toggle(),
            ),
            IconButton(
              tooltip: 'Muat ulang',
              icon: const Icon(Icons.refresh_rounded),
              onPressed: () => ref.read(libraryControllerProvider.notifier).refresh(),
            ),
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Lapisan Latar Belakang Spasial Berkedalaman (Atrium Atmosphere)
            if (!isPowerSaver) ...[
              SpatialParallaxLayer(
                depth: -0.35,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: const Alignment(0.7, -0.6),
                      radius: 1.4,
                      colors: [
                        theme.colorScheme.primary.withValues(alpha: 0.12),
                        theme.colorScheme.surface,
                      ],
                    ),
                  ),
                ),
              ),
              SpatialParallaxLayer(
                depth: -0.15,
                child: Align(
                  alignment: const Alignment(-0.8, 0.4),
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.colorScheme.secondary.withValues(alpha: 0.06),
                    ),
                  ),
                ),
              ),
            ],

            // Konten Utama Perpustakaan
            SafeArea(
              child: novels.when(
                loading: () => const LoadingView(),
                error: (e, _) => ErrorView(
                  message: 'Gagal memuat perpustakaan',
                  onRetry: () => ref.read(libraryControllerProvider.notifier).refresh(),
                ),
                data: (items) {
                  if (items.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.xl),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(AppSpacing.lg),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: theme.colorScheme.primaryContainer.withValues(alpha: 0.4),
                              ),
                              child: Icon(
                                Icons.auto_stories_outlined,
                                size: 54,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            const SizedBox(height: AppSpacing.lg),
                            Text(
                              'Atrium Masih Sunyi',
                              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            Text(
                              'Jelajahi karya novel dan tambahkan ke koleksi untuk menampilkannya di Atrium spasial.',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return NovelGrid(
                    novels: items,
                    onLongPress: (novel) async {
                      SpatialHaptics.cardPress();
                      final confirmed = await showAppConfirmDialog(
                        context,
                        title: 'Hapus dari Perpustakaan',
                        message: 'Hapus "${novel.title}" dari koleksi Atrium?',
                        confirmLabel: 'Hapus',
                      );
                      if (confirmed) {
                        await ref.read(libraryControllerProvider.notifier).removeFromLibrary(novel.id);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
