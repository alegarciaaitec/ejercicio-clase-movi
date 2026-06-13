import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/screens/screens.dart';

final GlobalKey<NavigatorState> _rootNavigatiorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

final goRouter = GoRouter(
  initialLocation: '/login',
  navigatorKey: _rootNavigatiorKey,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),

    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomeLayout(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/alumnos',
              builder: (context, state) => const AlumnosScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/materias',
              builder: (context, state) => const MateriasScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/asignacion',
              builder: (context, state) => const MateriasScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
