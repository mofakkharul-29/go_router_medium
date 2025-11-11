import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:routing/repository/providers/user_status_provider.dart';

class CustomElevatedButton extends ConsumerWidget {
  const CustomElevatedButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        final userStatusNotifier = ref.read(
          userStatusProvider.notifier,
        );
        await userStatusNotifier.setFirstLaunchDone();

        if (context.mounted) {
          context.go('/login');
        }
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(5),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.blueAccent,
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        fixedSize: Size(300, 60),
      ),
      child: Text('Get Started'),
    );
  }
}
