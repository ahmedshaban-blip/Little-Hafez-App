import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/parent_dashboard/presentation/screens/parent_dashboard_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/parent',
  routes: [
    GoRoute(
      path: '/parent',
      builder: (context, state) => const Scaffold(body: ParentDashboardScreen()),
    ),
  ],
);
