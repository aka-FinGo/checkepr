import '../../../core/services/supabase_service.dart';
import 'user_model.dart';

class AuthRepository {
  final _client = SupabaseService.client;

  Future<AppUser?> getCurrentUser() async {
    final session = _client.auth.currentSession;
    if (session == null) return null;

    final response = await _client
        .from('users')
        .select()
        .eq('id', session.user.id)
        .single();

    return AppUser.fromMap(response);
  }

  Future<void> signIn(String email, String password) async {
    await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _client.auth.signOut();
  }
}