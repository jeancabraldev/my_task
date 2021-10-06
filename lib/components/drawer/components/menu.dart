import 'package:flutter/material.dart';

class Menus extends StatelessWidget {
  final String title;
  final IconData icon;
  final GestureTapCallback? onTap;

  const Menus({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}