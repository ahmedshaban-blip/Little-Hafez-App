import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/celebration/presentation/screens/celebration_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/celebration',
  routes: [
    GoRoute(
      path: '/celebration',
      builder: (context, state) => const Scaffold(body: CelebrationScreen()),
    ),
  ],
);
