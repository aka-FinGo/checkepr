// FILE: lib/layout/header_bar.dart

import 'package:flutter/material.dart';

/// Yuqori panel (Header)
class HeaderBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;

  const HeaderBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}