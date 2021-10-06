import 'package:flutter/material.dart';

class MenuPages extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final GestureTapCallback? onTap;

  const MenuPages({
    Key? key,
    required this.title,
    this.subtitle,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle?? ''),
      onTap: onTap,
    );
  }
}