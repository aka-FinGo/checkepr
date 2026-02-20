// FILE: lib/providers/auth_provider.dart

import 'package:flutter/material.dart';
import '../core/supabase_service.dart';

/// Auth holatini boshqaruvchi Provider
class AuthProvider extends ChangeNotifier {

  /// Hozirgi foydalanuvchi
  User? user;

  /// Role (admin yoki employee)
  String? role;

  /// Login funksiyasi
  Future<void> login(String email, String password) async {
    final response = await SupabaseService.client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    user = response.user;

    /// Profile dan role ni olish
    final data = await SupabaseService.client
        .from('profiles')
        .select('role')
        .eq('id', user!.id)
        .single();

    role = data['role'];

    notifyListeners();
  }

  /// Logout funksiyasi
  Future<void> logout() async {
    await SupabaseService.client.auth.signOut();
    user = null;
    role = null;
    notifyListeners();
  }

  /// Login tekshirish
  bool get isLoggedIn => user != null;
}