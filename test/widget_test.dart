import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:litle_hafez/app/app.dart';
import 'package:litle_hafez/app/di/service_locator.dart';
import 'package:litle_hafez/core/theme/theme.dart';
import 'package:litle_hafez/features/celebration/presentation/screens/celebration_screen.dart';
import 'package:litle_hafez/features/games/presentation/screens/games_screen.dart';
import 'package:litle_hafez/features/journey/presentation/screens/journey_screen.dart';
import 'package:litle_hafez/features/onboarding/data/repositories/mock_onboarding_repository.dart';
import 'package:litle_hafez/features/onboarding/domain/entities/child_onboarding_profile.dart';
import 'package:litle_hafez/features/onboarding/logic/onboarding_cubit.dart';
import 'package:litle_hafez/features/onboarding/logic/onboarding_state.dart';
import 'package:litle_hafez/features/parent_dashboard/presentation/screens/parent_dashboard_screen.dart';
import 'package:litle_hafez/features/recitation/presentation/screens/recitation_screen.dart';
import 'package:litle_hafez/features/review/presentation/screens/review_screen.dart';
import 'package:litle_hafez/l10n/app_localizations.dart';

Widget _wrapMobileTestScreen(Widget child) {
  return ScreenUtilInit(
    designSize: const Size(390, 884),
    builder: (context, _) => MaterialApp(
      theme: AppTheme.light,
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar'), Locale('en')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Scaffold(body: child),
    ),
  );
}

void main() {
  setUpAll(() {
    setupServiceLocator();
  });

  group('OnboardingCubit', () {
    test(
      'initializes with default child profile and updates age/mascot',
      () async {
        final cubit = OnboardingCubit(MockOnboardingRepository());
        await cubit.initialize();

        expect(cubit.state.status, OnboardingStatus.ready);
        expect(cubit.state.ageYears, 7);
        expect(cubit.state.selectedMascot, OnboardingMascot.zayd);

        cubit.selectAge(8);
        cubit.selectMascot(OnboardingMascot.mariam);
        expect(cubit.state.ageYears, 8);
        expect(cubit.state.selectedMascot, OnboardingMascot.mariam);

        await cubit.completeOnboarding();
        expect(cubit.state.status, OnboardingStatus.completed);
        await cubit.close();
      },
    );
  });

  testWidgets('App renders OnboardingScreen with primary CTA', (tester) async {
    tester.view.physicalSize = const Size(390, 884);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const LittleHafizApp());
    await tester.pumpAndSettle();

    expect(find.text('أهلاً بك في حافظ الصغير'), findsOneWidget);
    expect(find.text('ابدأ الرحلة المباركة'), findsOneWidget);
  });

  testWidgets('JourneyScreen renders stages and Daily Mission', (tester) async {
    tester.view.physicalSize = const Size(390, 884);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(_wrapMobileTestScreen(const JourneyScreen()));
    await tester.pumpAndSettle();

    expect(find.text('سورة الإخلاص'), findsOneWidget);
    expect(find.text('Daily Mission'), findsOneWidget);
  });

  testWidgets('RecitationScreen renders ayah words and mic checker', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 884);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(_wrapMobileTestScreen(const RecitationScreen()));
    await tester.pumpAndSettle();

    expect(find.text('سورة الإخلاص'), findsOneWidget);
    expect(find.text('أَحَدٌ'), findsOneWidget);
    expect(find.text('استمع للشيخ المنشاوي'), findsOneWidget);
  });

  testWidgets('GamesScreen renders Badges Vault and switches to Games', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 884);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(_wrapMobileTestScreen(const GamesScreen()));
    await tester.pumpAndSettle();

    expect(find.text('خزانة الأوسمة'), findsOneWidget);
    expect(find.text('وسام حافظ الفاتحة'), findsOneWidget);

    await tester.tap(find.text('ألعاب الحفظ'));
    await tester.pumpAndSettle();
    expect(find.text('تحقق من الإجابة'), findsOneWidget);
  });

  testWidgets('ReviewScreen renders weekly garden and surah cards', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 884);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(_wrapMobileTestScreen(const ReviewScreen()));
    await tester.pumpAndSettle();

    expect(find.text('حديقة الأسبوع'), findsOneWidget);
    expect(find.text('سورة الفاتحة'), findsOneWidget);
  });

  testWidgets('ParentDashboardScreen renders overview and opens PIN gate', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 884);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(
      _wrapMobileTestScreen(const ParentDashboardScreen()),
    );
    await tester.pumpAndSettle();

    expect(find.text('منطقة ولي الأمر'), findsOneWidget);
    await tester.tap(find.text('قفل PIN'));
    await tester.pumpAndSettle();
    expect(find.text('7 × 4 = ?'), findsOneWidget);
  });

  testWidgets('CelebrationScreen renders honor certificate', (tester) async {
    tester.view.physicalSize = const Size(390, 884);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(_wrapMobileTestScreen(const CelebrationScreen()));
    await tester.pumpAndSettle();

    expect(find.text('مُبَارَكٌ يَا بَطَل!'), findsOneWidget);
    expect(
      find.text('السُّورَةُ التَّالِيَة: سُورَةُ الفَلَق'),
      findsOneWidget,
    );
  });
}
