// FILE: lib/screens/admin_dashboard.dart

import 'package:flutter/material.dart';
import '../layout/main_layout.dart';

/// Admin bosh sahifasi
class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Admin Dashboard",
      body: const Center(
        child: Text("Admin Content Here"),
      ),
    );
  }
}