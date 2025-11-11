import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routing/repository/providers/user_status_provider.dart';
import 'package:routing/routes/route_configaration.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(
    widgetsBinding: WidgetsBinding.instance,
  );

  final prefs = await SharedPreferences.getInstance();
  final isFirstLaunch =
      prefs.getBool('hasLaunchedBefore') ?? true;
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(
    ProviderScope(
      overrides: [
        userStatusProvider.overrideWith(
          (ref) => UserStatusNotifier(
            initialStatus: UserStatus(
              isFirstLaunch: isFirstLaunch,
              isLoggedIn: isLoggedIn,
            ),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
  WidgetsBinding.instance.addPostFrameCallback((_) {
    FlutterNativeSplash.remove();
  });
  // FlutterNativeSplash.remove();
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(
      RouteConfigaration.routerProvider,
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      routerConfig: goRouter,
    );
  }
}
