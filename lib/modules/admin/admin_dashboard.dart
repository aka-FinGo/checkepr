import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../auth/providers/auth_provider.dart';

class AdminDashboard extends ConsumerWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
        actions: [
          IconButton(
            onPressed: () => ref.read(authUserProvider.notifier).logout(),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: user.when(
        data: (u) => GridView.count(
          crossAxisCount: 3,
          padding: const EdgeInsets.all(16),
          children: const [
            _DashboardCard(title: 'Orders'),
            _DashboardCard(title: 'Inventory'),
            _DashboardCard(title: 'Production'),
            _DashboardCard(title: 'Finance'),
            _DashboardCard(title: 'Employees'),
            _DashboardCard(title: 'Reports'),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(child: Text('Error')),
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final String title;

  const _DashboardCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(child: Text(title)),
    );
  }
}