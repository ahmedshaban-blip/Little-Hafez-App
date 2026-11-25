import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/widgets/kid_bottom_nav_bar.dart';
import '../features/celebration/presentation/screens/celebration_screen.dart';
import '../features/games/presentation/screens/games_screen.dart';
import '../features/journey/presentation/screens/journey_screen.dart';
import '../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../features/parent_dashboard/presentation/screens/parent_dashboard_screen.dart';
import '../features/recitation/presentation/screens/recitation_screen.dart';
import '../features/review/presentation/screens/review_screen.dart';

/// Declarative GoRouter configuration for all 7 LittleHafiz screens.
final GoRouter appRouter = GoRouter(
  initialLocation: '/onboarding',
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/celebration',
      builder: (context, state) => const CelebrationScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: KidBottomNavBar(
            currentIndex: navigationShell.currentIndex,
            onTabSelected: (index) => navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            ),
          ),
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/journey',
              builder: (context, state) => const JourneyScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/recite',
              builder: (context, state) => const RecitationScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/games',
              builder: (context, state) => const GamesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/review',
              builder: (context, state) => const ReviewScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/parent',
              builder: (context, state) => const ParentDashboardScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
