import '../entities/child_onboarding_profile.dart';

/// Abstract contract for onboarding setup persistence.
abstract interface class OnboardingRepository {
  Future<ChildOnboardingProfile> loadDefaultProfile();
  Future<void> saveProfile(ChildOnboardingProfile profile);
}
