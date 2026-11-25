import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';
import '../../domain/entities/child_onboarding_profile.dart';
import 'onboarding_header.dart';
import 'parent_pin_setup_card.dart';
import 'profile_setup_card.dart';

/// Pure layout composition for Onboarding & Registration screen.
class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    super.key,
    required this.nameController,
    required this.selectedAge,
    required this.selectedMascot,
    required this.pinFilledCount,
    required this.isSubmitting,
    required this.onNameChanged,
    required this.onSelectAge,
    required this.onSelectMascot,
    required this.onTogglePinDot,
    required this.onStartPressed,
  });

  final TextEditingController nameController;
  final int selectedAge;
  final OnboardingMascot selectedMascot;
  final int pinFilledCount;
  final bool isSubmitting;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<int> onSelectAge;
  final ValueChanged<OnboardingMascot> onSelectMascot;
  final ValueChanged<int> onTogglePinDot;
  final VoidCallback onStartPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsetsDirectional.fromSTEB(
                AppSpacing.marginMobile.w,
                12.h,
                AppSpacing.marginMobile.w,
                16.h,
              ),
              child: Column(
                children: [
                  const OnboardingHeader(),
                  SizedBox(height: 20.h),
                  ProfileSetupCard(
                    nameController: nameController,
                    selectedAge: selectedAge,
                    selectedMascot: selectedMascot,
                    onNameChanged: onNameChanged,
                    onSelectAge: onSelectAge,
                    onSelectMascot: onSelectMascot,
                  ),
                  SizedBox(height: 16.h),
                  ParentPinSetupCard(
                    filledCount: pinFilledCount,
                    onToggleDot: onTogglePinDot,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(
              AppSpacing.marginMobile.w,
              8.h,
              AppSpacing.marginMobile.w,
              16.h,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 58.h,
              child: ElevatedButton(
                onPressed: isSubmitting ? null : onStartPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.ceruleanPrimary,
                  foregroundColor: colors.onPrimary,
                  shape: const RoundedRectangleBorder(
                    borderRadius: AppRadii.borderFull,
                  ),
                  elevation: 4,
                  shadowColor: colors.shadowAmbient.withValues(alpha: 0.25),
                ),
                child: isSubmitting
                    ? SizedBox(
                        width: 22.r,
                        height: 22.r,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: colors.onPrimary,
                        ),
                      )
                    : Text(
                        l10n.onboardingStartCta,
                        style: AppTypography.headlineMd.copyWith(
                          color: colors.onPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
