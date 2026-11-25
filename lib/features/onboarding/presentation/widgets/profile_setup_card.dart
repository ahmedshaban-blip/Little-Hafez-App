import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';
import '../../domain/entities/child_onboarding_profile.dart';
import 'mascot_selector_grid.dart';

/// Step 1 card for child name, age selector, and mascot companion.
class ProfileSetupCard extends StatelessWidget {
  const ProfileSetupCard({
    super.key,
    required this.nameController,
    required this.selectedAge,
    required this.selectedMascot,
    required this.onNameChanged,
    required this.onSelectAge,
    required this.onSelectMascot,
  });

  final TextEditingController nameController;
  final int selectedAge;
  final OnboardingMascot selectedMascot;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<int> onSelectAge;
  final ValueChanged<OnboardingMascot> onSelectMascot;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    const ages = [5, 6, 7, 8, 9, 10];

    return Container(
      padding: EdgeInsets.all(AppSpacing.lg.r),
      decoration: BoxDecoration(
        color: colors.surfaceContainerLowest,
        borderRadius: AppRadii.borderXl,
        boxShadow: AppShadows.softCard(colors.shadowAmbient),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _StepHeaderRow(
            stepNumber: l10n.stepOneNumber,
            title: l10n.onboardingStep1Title,
            badgeText: l10n.onboardingStep1Badge,
          ),
          SizedBox(height: 16.h),
          _FieldLabel(
            icon: Icons.person_outline_rounded,
            label: l10n.onboardingChildNameLabel,
          ),
          SizedBox(height: 8.h),
          TextField(
            controller: nameController,
            onChanged: onNameChanged,
            textAlign: TextAlign.center,
            style: AppTypography.headlineMd.copyWith(
              color: colors.textHigh,
              fontWeight: FontWeight.w700,
            ),
            decoration: InputDecoration(
              hintText: l10n.onboardingChildNameHint,
              filled: true,
              fillColor: colors.surfaceContainerLow,
              border: OutlineInputBorder(
                borderRadius: AppRadii.borderXl,
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: AppRadii.borderXl,
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: AppRadii.borderXl,
                borderSide: BorderSide(
                  color: colors.ceruleanPrimary,
                  width: 1.5,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 14.h,
                horizontal: 16.w,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          _FieldLabel(
            icon: Icons.cake_outlined,
            label: l10n.onboardingAgeLabel,
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ages.map((age) {
              final isSelected = age == selectedAge;
              return InkWell(
                onTap: () => onSelectAge(age),
                borderRadius: AppRadii.borderFull,
                child: Container(
                  width: 44.r,
                  height: 44.r,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected
                        ? colors.ceruleanPrimary
                        : colors.surfaceContainerLow,
                    boxShadow: isSelected
                        ? AppShadows.softCard(colors.ceruleanPrimary)
                        : null,
                  ),
                  child: Text(
                    '$age',
                    style: AppTypography.headlineMd.copyWith(
                      color: isSelected ? colors.onPrimary : colors.textHigh,
                      fontWeight: isSelected
                          ? FontWeight.w800
                          : FontWeight.w600,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 16.h),
          _FieldLabel(
            icon: Icons.pets_rounded,
            label: l10n.onboardingMascotLabel,
          ),
          SizedBox(height: 8.h),
          MascotSelectorGrid(
            selectedMascot: selectedMascot,
            onSelectMascot: onSelectMascot,
          ),
        ],
      ),
    );
  }
}

class _StepHeaderRow extends StatelessWidget {
  const _StepHeaderRow({
    required this.stepNumber,
    required this.title,
    required this.badgeText,
  });

  final String stepNumber;
  final String title;
  final String badgeText;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: colors.surfaceContainerLow)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 28.r,
                  height: 28.r,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: colors.ceruleanPrimary,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    stepNumber,
                    style: AppTypography.labelMd.copyWith(
                      color: colors.onPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Flexible(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.headlineMd.copyWith(
                      color: colors.textHigh,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: colors.ceruleanFixed,
              borderRadius: AppRadii.borderFull,
            ),
            child: Text(
              badgeText,
              style: AppTypography.labelSm.copyWith(
                color: colors.onCeruleanFixed,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      children: [
        Icon(icon, size: 18.r, color: colors.ceruleanPrimary),
        SizedBox(width: 6.w),
        Text(
          label,
          style: AppTypography.labelMd.copyWith(
            color: colors.textHigh,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
