import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/entities/child_onboarding_profile.dart';
import '../domain/repositories/onboarding_repository.dart';
import 'onboarding_state.dart';

/// Cubit managing child onboarding profile and parent PIN setup.
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(this._repository) : super(const OnboardingState.initial());

  final OnboardingRepository _repository;

  /// Loads initial onboarding defaults.
  Future<void> initialize() async {
    emit(state.copyWith(status: OnboardingStatus.loading));
    final profile = await _repository.loadDefaultProfile();
    if (isClosed) return;
    emit(
      state.copyWith(
        status: OnboardingStatus.ready,
        childName: profile.childName,
        ageYears: profile.ageYears,
        selectedMascot: profile.mascot,
        pinFilledCount: profile.pinFilledCount,
      ),
    );
  }

  void updateChildName(String name) {
    emit(state.copyWith(childName: name));
  }

  void selectAge(int age) {
    emit(state.copyWith(ageYears: age));
  }

  void selectMascot(OnboardingMascot mascot) {
    emit(state.copyWith(selectedMascot: mascot));
  }

  void togglePinDot(int dotIndex) {
    final nextCount = dotIndex + 1 == state.pinFilledCount
        ? dotIndex
        : dotIndex + 1;
    emit(state.copyWith(pinFilledCount: nextCount.clamp(0, 4)));
  }

  Future<void> completeOnboarding() async {
    emit(state.copyWith(status: OnboardingStatus.submitting));
    await _repository.saveProfile(
      ChildOnboardingProfile(
        childName: state.childName,
        ageYears: state.ageYears,
        mascot: state.selectedMascot,
        pinFilledCount: state.pinFilledCount,
      ),
    );
    if (isClosed) return;
    emit(state.copyWith(status: OnboardingStatus.completed));
  }
}
