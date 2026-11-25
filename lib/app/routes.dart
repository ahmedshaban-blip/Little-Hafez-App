import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/journey/presentation/screens/journey_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/journey',
  routes: [
    GoRoute(
      path: '/journey',
      builder: (context, state) => const Scaffold(body: JourneyScreen()),
    ),
  ],
);
