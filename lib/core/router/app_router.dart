import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/auth_controller.dart';
import '../../features/explore/presentation/explore_screen.dart';
import '../../features/library/presentation/library_screen.dart';
import '../../features/history/presentation/history_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/register_screen.dart';
import '../../features/novel_detail/presentation/novel_detail_screen.dart';
import '../../features/reader/presentation/reader_screen.dart';
import '../../features/publisher/presentation/post_novel_screen.dart';
import '../../features/publisher/presentation/post_chapter_screen.dart';
import '../../features/bookmarks/presentation/bookmarks_screen.dart';
import '../../features/profile/presentation/edit_profile_screen.dart';
import 'root_shell.dart';

/// Rute aplikasi.
abstract final class AppRoutes {
  static const home = '/';
  static const login = '/login';
  static const register = '/register';
  static String novelDetail(String id) => '/novel/$id';
  static String reader(String novelId, String chapterId) => '/novel/$novelId/read/$chapterId';
  static String postNovel = '/post-novel';
  static String postChapter(String novelId) => '/novel/$novelId/post-chapter';
  static const bookmarks = '/bookmarks';
  static const editProfile = '/edit-profile';
}

final rootNavigatorKey = GlobalKey<NavigatorState>();

/// Notifier sederhana agar GoRouter tahu kapan harus re-evaluate redirect.
class _AuthRefreshNotifier extends ChangeNotifier {
  void notify() => notifyListeners();
}

/// Router dengan redirect auth-aware.
final routerProvider = Provider<GoRouter>((ref) {
  final auth = ref.watch(authControllerProvider);
  final refreshNotifier = _AuthRefreshNotifier();

  // Saat status auth berubah, beri tahu GoRouter untuk re-evaluate redirect.
  ref.listen(authControllerProvider, (_, __) => refreshNotifier.notify());

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.home,
    refreshListenable: refreshNotifier,
    redirect: (context, state) {
      final isLoggedIn = auth.value == AuthStatus.authenticated;
      final authPending = auth.isLoading;

      final onAuthPage = state.matchedLocation == AppRoutes.login ||
          state.matchedLocation == AppRoutes.register;

      if (authPending) return null;

      if (!isLoggedIn) {
        return onAuthPage ? null : AppRoutes.login;
      }
      if (isLoggedIn && onAuthPage) {
        return AppRoutes.home;
      }
      return null;
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) => RootShell(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.home,
            builder: (context, state) => const ExploreScreen(),
          ),
          GoRoute(
            path: '/library',
            builder: (context, state) => const LibraryScreen(),
          ),
          GoRoute(
            path: '/history',
            builder: (context, state) => const HistoryScreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/novel/:id',
        builder: (context, state) => NovelDetailScreen(novelId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/novel/:novelId/read/:chapterId',
        builder: (context, state) => ReaderScreen(
          novelId: state.pathParameters['novelId']!,
          chapterId: state.pathParameters['chapterId']!,
        ),
      ),
      GoRoute(
        path: AppRoutes.postNovel,
        builder: (context, state) => const PostNovelScreen(),
      ),
      GoRoute(
        path: '/novel/:novelId/post-chapter',
        builder: (context, state) => PostChapterScreen(novelId: state.pathParameters['novelId']!),
      ),
      GoRoute(
        path: AppRoutes.bookmarks,
        builder: (context, state) => const BookmarksScreen(),
      ),
      GoRoute(
        path: AppRoutes.editProfile,
        builder: (context, state) => const EditProfileScreen(),
      ),
    ],
  );
});
