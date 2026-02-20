// FILE: lib/main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'providers/auth_provider.dart';
import 'screens/login_screen.dart';
import 'screens/admin_dashboard.dart';
import 'screens/employee_dashboard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Supabase initialize
  await Supabase.initialize(
    url: 'SUPABASE_URL',
    anonKey: 'SUPABASE_ANON_KEY',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AuthWrapper(),
      ),
    );
  }
}

/// Login yoki Dashboard ga yo‘naltirish
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final auth = Provider.of<AuthProvider>(context);

    if (!auth.isLoggedIn) {
      return const LoginScreen();
    }

    if (auth.role == "admin") {
      return const AdminDashboard();
    }

    return const EmployeeDashboard();
  }
}