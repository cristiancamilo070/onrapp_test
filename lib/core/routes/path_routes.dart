import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:onrapp_test/presentation/login/pages/login_page.dart';
import 'package:onrapp_test/presentation/product_detail/pages/product_detail_page.dart';
import 'package:onrapp_test/presentation/product_list/pages/product_list_page.dart';
import 'package:onrapp_test/presentation/splash_page.dart';
import 'package:onrapp_test/core/routes/app_routes.dart';

final goRouter = GoRouter(
  initialLocation: RoutesPaths.splashPage,
  routes: [
    GoRoute(
      path: RoutesPaths.splashPage,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const SplashPage(),
        transitionsBuilder: _fadeTransition,
      ),
    ),
    GoRoute(
      path: RoutesPaths.loginPage,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const LoginPage(),
        transitionsBuilder: _fadeTransition,
      ),
    ),
    GoRoute(
      path: RoutesPaths.productsPage,
      builder: (context, state) => const ProductListPage(),
    ),
    GoRoute(
      path: RoutesPaths.productDetailPage,
      builder: (context, state) {
        final productId = int.parse(state.pathParameters['id']!);
        return ProductDetailPage(productId: productId);
      },
    ),
  ],
);

Widget _fadeTransition(BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) =>
    FadeTransition(opacity: animation, child: child);

// Widget _slideTransition(BuildContext context, Animation<double> animation,
//         Animation<double> secondaryAnimation, Widget child) =>
//     SlideTransition(
//       position: animation.drive(
//         Tween(begin: const Offset(1, 0), end: Offset.zero)
//             .chain(CurveTween(curve: Curves.easeInOut)),
//       ),
//       child: child,
//     );
