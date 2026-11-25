import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/recitation/presentation/screens/recitation_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/recite',
  routes: [
    GoRoute(
      path: '/recite',
      builder: (context, state) => const Scaffold(body: RecitationScreen()),
    ),
  ],
);
