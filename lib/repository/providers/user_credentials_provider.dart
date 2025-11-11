import 'package:flutter_riverpod/legacy.dart';
import 'package:routing/repository/providers/user_credentials_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserNotifier
    extends StateNotifier<UserCredentialsState> {
  UserNotifier() : super(UserCredentialsState());

  Future<void> loadSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('savedEmail') ?? '';
    final password = prefs.getString('savedPassword') ?? '';
    final remember = prefs.getBool('rememberMe') ?? false;

    if (remember &&
        email.isNotEmpty &&
        password.isNotEmpty) {
      state = state.copyWith(
        email: email,
        password: password,
        isLoggedIn: true,
      );
    }
  }

  Future<void> login(
    String email,
    String password,
    bool rememberMe,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    if (rememberMe) {
      await prefs.setString('savedEmail', email);
      await prefs.setString('savedPassword', password);
      await prefs.setBool('rememberMe', true);
    } else {
      await prefs.remove('savedEmail');
      await prefs.remove('savedPassword');
      await prefs.setBool('rememberMe', false);
    }

    state = state.copyWith(
      email: email,
      password: password,
      isLoggedIn: true,
    );
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rememberMe', false);
    state = UserCredentialsState(); // clear everything
  }
}

final userProvider =
    StateNotifierProvider<
      UserNotifier,
      UserCredentialsState
    >((ref) {
      return UserNotifier();
    });
