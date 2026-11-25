import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';
import '../../domain/entities/games_vault_data.dart';

/// Interactive Memorization Games view (order ayahs of Surah Al-Ikhlas).
class AyahOrderingGameView extends StatelessWidget {
  const AyahOrderingGameView({
    super.key,
    required this.ayahItems,
    required this.selectedModeIndex,
    required this.selectedAyahIndex,
    required this.onSelectMode,
    required this.onSelectAyah,
    required this.onVerifyTap,
  });

  final List<AyahGameItem> ayahItems;
  final int selectedModeIndex;
  final int selectedAyahIndex;
  final ValueChanged<int> onSelectMode;
  final ValueChanged<int> onSelectAyah;
  final VoidCallback onVerifyTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    final modes = [
      l10n.gamesModeOrder,
      l10n.gamesModeNext,
      l10n.gamesModeComplete,
    ];

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: colors.surfaceContainerLowest,
            borderRadius: AppRadii.borderMd,
            border: Border.all(color: colors.borderHairline),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 40.r,
                      height: 40.r,
                      decoration: BoxDecoration(
                        color: colors.pastelBlueSurface,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.auto_awesome_rounded,
                        size: 22.r,
                        color: colors.brandSecondary,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.gamesSurahTitle,
                            overflow: TextOverflow.ellipsis,
                            style: AppTypography.headlineMd.copyWith(
                              color: colors.brandPrimary,
                            ),
                          ),
                          Text(
                            l10n.gamesSurahSubtitle,
                            overflow: TextOverflow.ellipsis,
                            style: AppTypography.labelSm.copyWith(
                              color: colors.textSubdued,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: colors.pastelBlueSurface,
                  borderRadius: AppRadii.borderFull,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      size: 18.r,
                      color: colors.brandSecondary,
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      l10n.gamesBonusPoints,
                      style: AppTypography.labelMd.copyWith(
                        color: colors.brandPrimary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(modes.length, (index) {
              final isSelected = index == selectedModeIndex;
              return Padding(
                padding: EdgeInsetsDirectional.only(end: 8.w),
                child: InkWell(
                  onTap: () => onSelectMode(index),
                  borderRadius: AppRadii.borderFull,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 9.h,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? colors.brandSecondary
                          : colors.pastelBlueSurface,
                      borderRadius: AppRadii.borderFull,
                      boxShadow: isSelected
                          ? AppShadows.tactileLip(
                              colors.brandPrimary,
                              offsetY: 3,
                            )
                          : null,
                    ),
                    child: Text(
                      modes[index],
                      style: AppTypography.labelLg.copyWith(
                        color: isSelected
                            ? colors.onSecondary
                            : colors.brandPrimary,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(14.r),
          decoration: BoxDecoration(
            color: colors.pastelBlueSurface,
            borderRadius: AppRadii.borderMd,
            border: Border.all(color: colors.pastelBlueBorder),
          ),
          child: Text(
            l10n.gamesPromptBanner,
            style: AppTypography.bodyLg.copyWith(
              color: colors.brandPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        ...List.generate(ayahItems.length, (index) {
          final item = ayahItems[index];
          final isSelected = index == selectedAyahIndex;
          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: InkWell(
              onTap: () => onSelectAyah(index),
              borderRadius: AppRadii.borderMd,
              child: Container(
                padding: EdgeInsets.all(14.r),
                decoration: BoxDecoration(
                  color: colors.surfaceContainerLowest,
                  borderRadius: AppRadii.borderMd,
                  border: Border.all(
                    color: isSelected
                        ? colors.brandSecondary
                        : colors.borderHairline,
                    width: 2,
                  ),
                  boxShadow: AppShadows.tactileLip(
                    isSelected
                        ? colors.pastelBlueBorder
                        : colors.borderHairline,
                    offsetY: 3,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 38.r,
                      height: 38.r,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: colors.brandSecondary,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        item.orderNumberArabic,
                        style: AppTypography.headlineMd.copyWith(
                          color: colors.onSecondary,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        item.ayahText,
                        textDirection: TextDirection.rtl,
                        style: AppTypography.quranAyahMd.copyWith(
                          color: colors.brandPrimary,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
        SizedBox(height: 4.h),
        SizedBox(
          width: double.infinity,
          height: 54.h,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: colors.brandSecondary,
              borderRadius: AppRadii.borderMd,
              boxShadow: AppShadows.tactileLip(colors.brandPrimary, offsetY: 4),
            ),
            child: ElevatedButton.icon(
              onPressed: onVerifyTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.brandSecondary,
                foregroundColor: colors.onSecondary,
                shape: const RoundedRectangleBorder(
                  borderRadius: AppRadii.borderMd,
                ),
              ),
              icon: const Icon(Icons.verified_rounded),
              label: Text(
                l10n.gamesVerifyAnswer,
                style: AppTypography.headlineMd.copyWith(
                  color: colors.onSecondary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
