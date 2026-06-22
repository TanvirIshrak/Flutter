import 'package:flutter/material.dart';
import 'package:go_route/screen/home_screen.dart';
import 'package:go_route/screen/product_details_screen.dart';
import 'package:go_router/go_router.dart';
/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Home_Screen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/product_details',
          builder: (BuildContext context, GoRouterState state) {
            return const ProductScreen();
          },
        ),
      ],
    ),
  ],
);