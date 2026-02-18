import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/auth_repository.dart';
import '../data/user_model.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository());

final authUserProvider =
    StateNotifierProvider<AuthNotifier, AsyncValue<AppUser?>>(
        (ref) => AuthNotifier(ref));

class AuthNotifier extends StateNotifier<AsyncValue<AppUser?>> {
  final Ref ref;

  AuthNotifier(this.ref) : super(const AsyncLoading()) {
    loadUser();
  }

  Future<void> loadUser() async {
    try {
      final repo = ref.read(authRepositoryProvider);
      final user = await repo.getCurrentUser();
      state = AsyncData(user);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> logout() async {
    await ref.read(authRepositoryProvider).signOut();
    state = const AsyncData(null);
  }
}