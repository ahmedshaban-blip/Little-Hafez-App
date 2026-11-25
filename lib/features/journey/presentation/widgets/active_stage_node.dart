import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';
import '../../../../core/widgets/custom_avatar_illustration.dart';

/// Active tactile Al-Ikhlas stage node with Noor speech bubble.
class ActiveStageNode extends StatelessWidget {
  const ActiveStageNode({super.key, required this.onPlayTap});

  final VoidCallback onPlayTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          SizedBox(
            width: 280.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 174.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 9.h,
                  ),
                  decoration: BoxDecoration(
                    color: colors.textSubdued,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppRadii.xl),
                      topRight: Radius.circular(AppRadii.xl),
                      bottomLeft: Radius.circular(AppRadii.xl),
                    ),
                    boxShadow: AppShadows.softCard(colors.shadowAmbient),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.journeyStage2BubbleTitle,
                        style: AppTypography.labelMd.copyWith(
                          color: colors.onPrimary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        l10n.journeyStage2BubbleBody,
                        style: AppTypography.labelSm.copyWith(
                          color: colors.ceruleanFixed,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    CustomAvatarIllustration(
                      type: MascotAvatarType.zayd,
                      size: 54,
                      borderColor: colors.ceruleanFixed,
                      borderWidth: 2,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      l10n.journeyMascotNoor,
                      style: AppTypography.labelSm.copyWith(
                        color: colors.ceruleanPrimary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          InkWell(
            onTap: onPlayTap,
            borderRadius: AppRadii.borderXl,
            child: Container(
              width: 196.w,
              padding: EdgeInsets.all(AppSpacing.md.r),
              decoration: BoxDecoration(
                color: colors.ceruleanPrimary,
                borderRadius: AppRadii.borderXl,
                boxShadow: AppShadows.tactileLip(
                  colors.primary,
                  offsetY: 8,
                  ambientColor: colors.primary,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 3.h,
                    ),
                    decoration: BoxDecoration(
                      color: colors.ceruleanContainer,
                      borderRadius: AppRadii.borderFull,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.mic_rounded,
                          size: 13.r,
                          color: colors.ceruleanFixed,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          l10n.journeyAyahRangeChip,
                          style: AppTypography.labelSm.copyWith(
                            color: colors.ceruleanFixed,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    l10n.journeyStage2Ar,
                    style: AppTypography.headlineMd.copyWith(
                      color: colors.onPrimary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    l10n.journeyStage2En,
                    style: AppTypography.labelMd.copyWith(
                      color: colors.ceruleanFixed,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 7.h),
                    decoration: BoxDecoration(
                      color: colors.surfaceContainerLowest,
                      borderRadius: AppRadii.borderFull,
                      boxShadow: AppShadows.softCard(colors.shadowAmbient),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_arrow_rounded,
                          size: 18.r,
                          color: colors.ceruleanPrimary,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          l10n.journeyPlayNow,
                          style: AppTypography.labelMd.copyWith(
                            color: colors.ceruleanPrimary,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              3,
              (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                width: 16.w,
                height: 13.h,
                decoration: BoxDecoration(
                  color: colors.textSubdued,
                  borderRadius: AppRadii.borderFull,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
