import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../modules/auth/screens/login_screen.dart';
import '../../modules/auth/screens/splash_screen.dart';
import '../../modules/dashboard/dashboard_screen.dart';
final appRouterProvider = Provider<GoRouter>((ref) {
  final userState = ref.watch(authUserProvider);

  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (_, __) => const LoginScreen(),
      ),
      GoRoute(
        path: '/admin',
        builder: (_, __) => const AdminDashboard(),
      ),
      GoRoute(
        path: '/manager',
        builder: (_, __) => const ManagerDashboard(),
      ),
    ],
    redirect: (_, state) {
      return userState.when(
        data: (user) {
          if (user == null) return '/login';

          if (user.role == 'admin') return '/admin';
          if (user.role == 'manager') return '/manager';

          return '/login';
        },
        loading: () => null,
        error: (_, __) => '/login',
      );
    },
  );
});
final appRouterProvider = Provider<GoRouter>((ref) {
  final isLoggedIn = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (_, __) => const LoginScreen(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (_, __) => const DashboardScreen(),
      ),
    ],
    redirect: (_, state) {
      if (!isLoggedIn && state.uri.toString() != '/login') {
        return '/login';
      }
      return null;
    },
  );
});