// FILE: lib/main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'providers/auth_provider.dart';
import 'screens/login_screen.dart';
import 'screens/admin_dashboard.dart';
import 'screens/employee_dashboard.dart';

/// 🔐 Environment o‘zgaruvchilarni olish
/// --dart-define orqali keladi
const String supabaseUrl =
    String.fromEnvironment('SUPABASE_URL');

const String supabaseAnonKey =
    String.fromEnvironment('SUPABASE_ANON_KEY');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Agar key bo‘lmasa build to‘xtaydi
  if (supabaseUrl.isEmpty || supabaseAnonKey.isEmpty) {
    throw Exception("SUPABASE environment variables not found");
  }

  /// Supabase initialize
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthWrapper(),
      ),
    );
  }
}

/// Login yoki Dashboard redirect
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    if (!auth.isLoggedIn) return const LoginScreen();
    if (auth.role == "admin") return const AdminDashboard();
    return const EmployeeDashboard();
  }
}