import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routing/repository/providers/screens/screen_provider.dart';

class GetBottomNavigationBar extends StatelessWidget {
  final int currentPage;
  final WidgetRef ref;
  const GetBottomNavigationBar({
    super.key,
    required this.currentPage,
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentPage,
      backgroundColor: Colors.green[200],
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: Colors.grey[800],
      selectedItemColor: Colors.black,
      unselectedIconTheme: IconThemeData(
        color: Colors.grey[800],
      ),
      iconSize: 24.0,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      items: [
        getNavigationBarItem(
          Icons.home_outlined,
          Icons.home_rounded,
          'Home',
        ),
        getNavigationBarItem(
          Icons.history_toggle_off,
          Icons.history_outlined,
          'History',
        ),
        getNavigationBarItem(
          Icons.favorite_outline,
          Icons.favorite_rounded,
          'Favorite',
        ),
        getNavigationBarItem(
          Icons.settings_outlined,
          Icons.settings_rounded,
          'Settings',
        ),
      ],
      onTap: (value) {
        ref
            .read(currentPageProvider.notifier)
            .pageValueChange(value);
      },
    );
  }

  BottomNavigationBarItem getNavigationBarItem(
    IconData icon,
    IconData activeIcon,
    String label,
  ) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      activeIcon: Icon(activeIcon, color: Colors.black),
      label: label,
    );
  }
}
