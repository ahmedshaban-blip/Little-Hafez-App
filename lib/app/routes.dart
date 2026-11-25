import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/review/presentation/screens/review_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/review',
  routes: [
    GoRoute(
      path: '/review',
      builder: (context, state) => const Scaffold(body: ReviewScreen()),
    ),
  ],
);
