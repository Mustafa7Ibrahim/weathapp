import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weathapp/core/config/routes/routes_names.dart';
import 'package:weathapp/modules/home/views/home_view.dart';

/// Global navigator key to be used by [GoRouter].
final _globalNavigatorKey = GlobalKey<NavigatorState>();

/// add a global context
final globalContext = _globalNavigatorKey.currentState?.context;

/// Global router navigation to be used by [GoRouter].
final router = GoRouter.of(_globalNavigatorKey.currentContext!);

/// Routes configuration for [GoRouter].
class RoutesConfig {
  /// [GoRouter] instance.
  static final GoRouter router = GoRouter(
    navigatorKey: _globalNavigatorKey,
    debugLogDiagnostics: true,
    routerNeglect: true,
    initialLocation: '/',
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        name: RouteNames.init,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
