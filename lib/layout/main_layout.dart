// FILE: lib/layout/main_layout.dart

import 'package:flutter/material.dart';
import 'header_bar.dart';
import 'bottom_navbar.dart';

/// Barcha sahifalar uchun umumiy layout
class MainLayout extends StatefulWidget {

  final String title;
  final Widget body;

  const MainLayout({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {

  int currentIndex = 0;

  /// Navbar bosilganda ishlaydi
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderBar(title: widget.title),
      body: widget.body,
      bottomNavigationBar: BottomNavbar(
        currentIndex: currentIndex,
        onTap: onTap,
      ),
    );
  }
}