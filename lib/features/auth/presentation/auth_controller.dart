import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/auth_repository.dart';
import '../../../shared/models/user.dart';

part 'auth_controller.g.dart';

/// Status autentikasi global.
enum AuthStatus { unknown, authenticated, unauthenticated }

@riverpod
class AuthController extends _$AuthController {
  @override
  Future<AuthStatus> build() async {
    // Boot: cek apakah ada sesi tersimpan.
    final repo = ref.watch(authRepositoryProvider);
    final hasSession = await repo.hasSession();
    if (!hasSession) return AuthStatus.unauthenticated;

    try {
      final user = await repo.me();
      if (user == null) return AuthStatus.unauthenticated;
      return AuthStatus.authenticated;
    } catch (_) {
      // Sesi tidak valid → bersihkan.
      await repo.logout();
      return AuthStatus.unauthenticated;
    }
  }

  Future<void> login({required String email, required String password}) async {
    final repo = ref.read(authRepositoryProvider);
    await repo.login(email: email, password: password);
    ref.invalidateSelf();
    await future;
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final repo = ref.read(authRepositoryProvider);
    await repo.register(name: name, email: email, password: password);
    ref.invalidateSelf();
    await future;
  }

  Future<void> logout() async {
    final repo = ref.read(authRepositoryProvider);
    await repo.logout();
    ref.invalidateSelf();
  }
}

/// User yang sedang login (null jika belum login).
final currentUserProvider = FutureProvider<User?>((ref) async {
  final status = await ref.watch(authControllerProvider.future);
  if (status != AuthStatus.authenticated) return null;
  try {
    return await ref.read(authRepositoryProvider).me();
  } catch (_) {
    return null;
  }
});
