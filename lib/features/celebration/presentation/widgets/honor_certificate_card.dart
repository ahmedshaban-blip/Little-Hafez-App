import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';
import '../../../../core/widgets/custom_avatar_illustration.dart';
import '../../domain/entities/completion_certificate.dart';
import 'certificate_metrics_grid.dart';

/// Main Honor Certificate Card matching surah_completion_celebration.png.
class HonorCertificateCard extends StatelessWidget {
  const HonorCertificateCard({super.key, required this.certificate});

  final CompletionCertificate certificate;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: colors.surfaceContainerLowest,
        borderRadius: AppRadii.borderXl,
        boxShadow: AppShadows.tier2Floating(colors.shadowAmbient),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -36.r,
            right: -36.r,
            child: Container(
              width: 90.r,
              height: 90.r,
              decoration: BoxDecoration(
                color: colors.ceruleanFixed.withValues(alpha: 0.45),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -36.r,
            left: -36.r,
            child: Container(
              width: 90.r,
              height: 90.r,
              decoration: BoxDecoration(
                color: colors.surfaceContainer.withValues(alpha: 0.7),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(AppSpacing.md.r),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    color: colors.ceruleanPrimary,
                    borderRadius: AppRadii.borderFull,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.verified_rounded,
                        size: 16.r,
                        color: colors.onPrimary,
                      ),
                      SizedBox(width: 6.w),
                      Flexible(
                        child: Text(
                          l10n.celebrationCertHeader,
                          overflow: TextOverflow.ellipsis,
                          style: AppTypography.labelMd.copyWith(
                            color: colors.onPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            colors.ceruleanPrimary,
                            colors.ceruleanContainer,
                          ],
                        ),
                      ),
                      child: const CustomAvatarIllustration(
                        type: MascotAvatarType.zayd,
                        size: 100,
                        borderWidth: 0,
                      ),
                    ),
                    Positioned(
                      bottom: -8.h,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 3.h,
                        ),
                        decoration: BoxDecoration(
                          color: colors.ceruleanPrimary,
                          borderRadius: AppRadii.borderFull,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.stars_rounded,
                              size: 15.r,
                              color: colors.onPrimary,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              l10n.celebrationDistinguishedBadge,
                              style: AppTypography.labelSm.copyWith(
                                color: colors.onPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18.h),
                Text(
                  l10n.celebrationGrantedTo,
                  style: AppTypography.labelSm.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  certificate.recipientNameAge,
                  style: AppTypography.headlineLgMobile.copyWith(
                    color: colors.ceruleanPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 14.h),
                CertificateMetricsGrid(certificate: certificate),
                SizedBox(height: 14.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: colors.surfaceContainer,
                    borderRadius: AppRadii.borderLg,
                  ),
                  child: Text(
                    certificate.quoteAyah,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: AppTypography.quranAyahMd.copyWith(
                      color: colors.ceruleanPrimary,
                      fontWeight: FontWeight.w700,
                      height: 1.6,
                    ),
                  ),
                ),
                SizedBox(height: 14.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: 30.r,
                            height: 30.r,
                            decoration: BoxDecoration(
                              color: colors.ceruleanFixed,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.verified_user_rounded,
                              size: 17.r,
                              color: colors.onCeruleanFixed,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Flexible(
                            child: Text(
                              l10n.celebrationFooterFamily,
                              overflow: TextOverflow.ellipsis,
                              style: AppTypography.labelSm.copyWith(
                                color: colors.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Row(
                      children: [
                        Icon(
                          Icons.stars_rounded,
                          size: 17.r,
                          color: colors.ceruleanPrimary,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          certificate.hijriYear,
                          style: AppTypography.labelSm.copyWith(
                            color: colors.ceruleanPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
