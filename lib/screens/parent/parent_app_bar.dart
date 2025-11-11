import 'package:flutter/material.dart';

class ParentAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final IconData icon;

  const ParentAppBar({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green[200],
      foregroundColor: Colors.black,
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      elevation: 15,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(icon)),
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight);
}
