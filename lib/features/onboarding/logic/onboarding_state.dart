import 'package:equatable/equatable.dart';

import '../domain/entities/child_onboarding_profile.dart';

/// Status of onboarding submission.
enum OnboardingStatus { initial, loading, ready, submitting, completed, error }

/// Immutable state for [OnboardingCubit].
final class OnboardingState extends Equatable {
  const OnboardingState({
    required this.status,
    required this.childName,
    required this.ageYears,
    required this.selectedMascot,
    required this.pinFilledCount,
    this.errorMessage,
  });

  const OnboardingState.initial()
    : status = OnboardingStatus.initial,
      childName = 'زيد',
      ageYears = 7,
      selectedMascot = OnboardingMascot.zayd,
      pinFilledCount = 2,
      errorMessage = null;

  final OnboardingStatus status;
  final String childName;
  final int ageYears;
  final OnboardingMascot selectedMascot;
  final int pinFilledCount;
  final String? errorMessage;

  OnboardingState copyWith({
    OnboardingStatus? status,
    String? childName,
    int? ageYears,
    OnboardingMascot? selectedMascot,
    int? pinFilledCount,
    String? errorMessage,
  }) {
    return OnboardingState(
      status: status ?? this.status,
      childName: childName ?? this.childName,
      ageYears: ageYears ?? this.ageYears,
      selectedMascot: selectedMascot ?? this.selectedMascot,
      pinFilledCount: pinFilledCount ?? this.pinFilledCount,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    childName,
    ageYears,
    selectedMascot,
    pinFilledCount,
    errorMessage,
  ];
}
