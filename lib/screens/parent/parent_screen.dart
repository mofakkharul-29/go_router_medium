import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routing/repository/providers/screens/screen_provider.dart';
import 'package:routing/screens/main/favourites.dart';
import 'package:routing/screens/main/history.dart';
import 'package:routing/screens/main/main_screen.dart';
import 'package:routing/screens/main/settings.dart';
import 'package:routing/screens/parent/get_bottom_navigation_bar.dart';
import 'package:routing/screens/parent/parent_app_bar.dart';

class ParentScreen extends ConsumerWidget {
  const ParentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(currentPageProvider);

    final List<Widget> screens = [
      MainScreen(),
      History(),
      Favourites(),
      Settings(),
    ];

    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: ParentAppBar(
        title: 'Explore YourSelf',
        icon: Icons.dark_mode_outlined,
      ),
      body: screens[currentPage],
      bottomNavigationBar: GetBottomNavigationBar(
        currentPage: currentPage,
        ref: ref,
      ),
    );
  }
}
