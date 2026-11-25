import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/games/presentation/screens/games_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/games',
  routes: [
    GoRoute(
      path: '/games',
      builder: (context, state) => const Scaffold(body: GamesScreen()),
    ),
  ],
);
