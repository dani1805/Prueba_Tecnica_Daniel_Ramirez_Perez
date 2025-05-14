import 'package:flutter/material.dart';

class StandardAppBar extends StatelessWidget implements PreferredSize {
  const StandardAppBar({
    super.key,
    required this.elevation,
    this.background,
    this.title,
    this.isBack = false,
    this.actions,
  });

  final Color? background;
  final double elevation;
  final Widget? title;
  final bool isBack;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: background,
      elevation: elevation,
      leadingWidth: isBack ? null : 100,
      title: title,
      titleTextStyle: const TextStyle(fontSize: 16),
      centerTitle: false,
      actions: actions,
    );
  }

  @override
  Widget get child => const SizedBox.shrink();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
