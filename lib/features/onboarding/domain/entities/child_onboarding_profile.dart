/// Available learning companion mascots during onboarding.
enum OnboardingMascot { zayd, mariam, adam, noor }

/// Pure domain entity representing child onboarding setup.
class ChildOnboardingProfile {
  const ChildOnboardingProfile({
    required this.childName,
    required this.ageYears,
    required this.mascot,
    required this.pinFilledCount,
  });

  final String childName;
  final int ageYears;
  final OnboardingMascot mascot;
  final int pinFilledCount;
}
