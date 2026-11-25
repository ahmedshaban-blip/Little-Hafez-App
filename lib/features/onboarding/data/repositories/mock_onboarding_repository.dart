import '../../domain/entities/child_onboarding_profile.dart';
import '../../domain/repositories/onboarding_repository.dart';

/// In-memory mock repository for onboarding UI/UX without a database.
class MockOnboardingRepository implements OnboardingRepository {
  ChildOnboardingProfile _cachedProfile = const ChildOnboardingProfile(
    childName: 'زيد',
    ageYears: 7,
    mascot: OnboardingMascot.zayd,
    pinFilledCount: 2,
  );

  @override
  Future<ChildOnboardingProfile> loadDefaultProfile() async {
    return _cachedProfile;
  }

  @override
  Future<void> saveProfile(ChildOnboardingProfile profile) async {
    _cachedProfile = profile;
  }
}
