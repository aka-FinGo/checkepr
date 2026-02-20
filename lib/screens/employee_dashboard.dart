// FILE: lib/screens/employee_dashboard.dart

import 'package:flutter/material.dart';
import '../layout/main_layout.dart';

/// Employee bosh sahifasi
class EmployeeDashboard extends StatelessWidget {
  const EmployeeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Employee Dashboard",
      body: const Center(
        child: Text("Employee Content Here"),
      ),
    );
  }
}