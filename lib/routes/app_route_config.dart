import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn/home_screen.dart';
import 'package:learn/other.dart';
import 'package:learn/routes/app_route_contants.dart';
import 'package:learn/screens/favourite_screen.dart';

class MyAppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: MyAppRouteConstants.homeRoute,
        path: '/',
        pageBuilder: (context, state) =>
            const MaterialPage(child: HomeScreen()),
      ),
      GoRoute(
        name: MyAppRouteConstants.favouriteRoute,
        path: '/favourite',
        pageBuilder: (context, state) =>
            const MaterialPage(child: FavouriteScreen()),
      ),
      GoRoute(
        name: MyAppRouteConstants.itemRoute,
        path: '/item',
        pageBuilder: (context, state) =>
            const MaterialPage(child: ItemScreen()),
      ),
    ],
  );
}
