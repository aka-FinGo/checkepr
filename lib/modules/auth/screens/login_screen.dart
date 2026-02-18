import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final repo = ref.read(authRepositoryProvider);

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(controller: emailController),
              TextField(
                controller: passwordController,
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () async {
                  await repo.signIn(
                    emailController.text,
                    passwordController.text,
                  );
                  ref.read(authStateProvider.notifier).state = true;
                },
                child: const Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}