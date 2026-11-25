import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../domain/entities/recitation_ayah.dart';

/// Sacred pillowed ayah display card with interactive word highlighting.
class AyahDisplayCard extends StatelessWidget {
  const AyahDisplayCard({
    super.key,
    required this.ayah,
    required this.activeWordIndex,
    required this.onWordTap,
  });

  final RecitationAyah ayah;
  final int activeWordIndex;
  final ValueChanged<int> onWordTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 14.h),
          padding: EdgeInsets.fromLTRB(16.w, 28.h, 16.w, 22.h),
          decoration: BoxDecoration(
            color: colors.surfaceContainerLowest,
            borderRadius: AppRadii.borderXl,
            boxShadow: AppShadows.tier2Floating(colors.shadowAmbient),
          ),
          child: Column(
            children: [
              Text(
                ayah.basmalah,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                style: AppTypography.quranAyahMd.copyWith(
                  color: colors.onSurfaceVariant.withValues(alpha: 0.85),
                ),
              ),
              SizedBox(height: 16.h),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10.w,
                  runSpacing: 12.h,
                  children: [
                    ...List.generate(ayah.words.length, (index) {
                      final isActive = index == activeWordIndex;
                      return InkWell(
                        onTap: () => onWordTap(index),
                        borderRadius: AppRadii.borderXl,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          padding: EdgeInsets.symmetric(
                            horizontal: isActive ? 16.w : 10.w,
                            vertical: 6.h,
                          ),
                          decoration: isActive
                              ? BoxDecoration(
                                  color: colors.secondaryFixed,
                                  borderRadius: AppRadii.borderXl,
                                  border: Border.all(
                                    color: colors.secondaryContainer,
                                    width: 2.5,
                                  ),
                                  boxShadow: AppShadows.focusGlow(
                                    colors.focusRing,
                                  ),
                                )
                              : null,
                          child: Text(
                            ayah.words[index],
                            style: AppTypography.quranAyahLg.copyWith(
                              color: isActive
                                  ? colors.primary
                                  : colors.textHigh,
                              fontWeight: FontWeight.w700,
                              height: 1.5,
                            ),
                          ),
                        ),
                      );
                    }),
                    Container(
                      width: 46.r,
                      height: 46.r,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: colors.surfaceContainer,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        ayah.ayahEndSymbol,
                        style: AppTypography.headlineMd.copyWith(
                          color: colors.ceruleanPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colors.primary, colors.secondary],
            ),
            borderRadius: AppRadii.borderFull,
            boxShadow: AppShadows.softCard(colors.primary),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star_rounded, size: 15.r, color: colors.onPrimary),
              SizedBox(width: 6.w),
              Text(
                ayah.ayahChip,
                style: AppTypography.labelSm.copyWith(
                  color: colors.onPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
