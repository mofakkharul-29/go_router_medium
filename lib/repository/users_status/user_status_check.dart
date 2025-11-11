import 'package:shared_preferences/shared_preferences.dart';

class UserStatusCheck {
  Future<bool> isFirstLaunched() async {
    final SharedPreferences pref =
        await SharedPreferences.getInstance();

    if (pref.containsKey('hasLaunchedBefore')) {
      return false;
    }
    pref.setBool('hasLaunchedBefore', true);
    return true;
  }
}
