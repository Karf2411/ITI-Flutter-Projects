import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manage_tasks/Features/auth/views/create_acount_view.dart';
import 'package:manage_tasks/Features/taps/views/home_view.dart';
import 'package:manage_tasks/Features/splash/views/splash_view.dart';

class Routes {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: '/create-account',
        builder: (BuildContext context, GoRouterState state) {
          return const CreateAccountView();
        },
      ),
    ],
  );
}
