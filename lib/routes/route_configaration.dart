import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:routing/constant/router_name.dart';
import 'package:routing/repository/providers/user_status_provider.dart';
import 'package:routing/screens/landing/landing_screen.dart';
import 'package:routing/screens/log_reg_screen/login_screen.dart';
import 'package:routing/screens/main/main_screen.dart';
import 'package:routing/screens/parent/parent_screen.dart';
import 'package:routing/screens/products/product_details_screen.dart';
import 'package:routing/screens/products/purchase_screen.dart';

class RouteConfigaration {
  static final routerProvider = Provider<GoRouter>((ref) {
    final userStatus = ref.watch(userStatusProvider);

    return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          name: landingScreenRouteName,
          builder: (context, state) =>
              const LandingScreen(),
        ),
        GoRoute(
          path: '/login',
          name: loginScreenRouteName,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/parent',
          name: parentScreenRouteName,
          builder: (context, state) => const ParentScreen(),
        ),
        GoRoute(
          path: '/main',
          name: mainScreenRouteName,
          builder: (context, state) => const MainScreen(),
          routes: [
            GoRoute(
              path: 'product-details/:productId',
              name: productDetailsScreen,
              builder: (context, state) {
                final productId =
                    state.pathParameters['productId']!;
                return ProductDetailsScreen(
                  productId: productId,
                );
              },
              routes: [
                GoRoute(
                  path: 'product-purchase',
                  name: productPurchaseScreen,
                  builder: (context, state) {
                    final extra =
                        state.extra
                            as Map<String, dynamic>? ??
                        {};

                    return PurchaseScreen(
                      name: extra['name'] ?? 'Unknown',
                      details:
                          extra['details'] ??
                          'Not Provided',
                      previousPrice:
                          extra['previousPrice']
                              ?.toString() ??
                          '0',
                      newPrice:
                          extra['newPrice']?.toString() ??
                          '0',
                      image: extra['image'].toString(),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
      redirect: (context, state) {
        final isFirstLaunch = userStatus.isFirstLaunch;
        final isLoggedIn = userStatus.isLoggedIn;
        final location = state.uri.path;

        if (isFirstLaunch) {
          return location == '/' ? null : '/';
        }

        if (!isLoggedIn) {
          return location == '/login' ? null : '/login';
        }
        if (isLoggedIn &&
            (location == '/' || location == '/login')) {
          return '/parent';
        }
        return null;
      },
    );
  });
}
