import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserStatus {
  final bool isFirstLaunch;
  final bool isLoggedIn;

  const UserStatus({
    required this.isFirstLaunch,
    required this.isLoggedIn,
  });
}

class UserStatusNotifier extends StateNotifier<UserStatus> {
  UserStatusNotifier({UserStatus? initialStatus})
    : super(
        initialStatus ??
            const UserStatus(
              isFirstLaunch: true,
              isLoggedIn: false,
            ),
      ) {
    if (initialStatus == null) {
      _loadStatus();
    }
  }

  Future<void> _loadStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstLaunch =
        prefs.getBool('hasLaunchedBefore') ?? true;
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    state = UserStatus(
      isFirstLaunch: isFirstLaunch,
      isLoggedIn: isLoggedIn,
    );
  }

  Future<void> setFirstLaunchDone() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasLaunchedBefore', false);
    state = UserStatus(
      isFirstLaunch: false,
      isLoggedIn: state.isLoggedIn,
    );
  }

  Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', value);
    state = UserStatus(
      isFirstLaunch: state.isFirstLaunch,
      isLoggedIn: value,
    );
  }
}

final userStatusProvider =
    StateNotifierProvider<UserStatusNotifier, UserStatus>((
      ref,
    ) {
      return UserStatusNotifier();
    });