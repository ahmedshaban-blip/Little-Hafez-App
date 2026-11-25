import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';
import '../../../../core/widgets/custom_avatar_illustration.dart';

/// Welcoming top avatar and headline for the onboarding screen.
class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;
    return Column(
      children: [
        CustomAvatarIllustration(
          type: MascotAvatarType.zayd,
          size: 80,
          borderColor: colors.ceruleanFixed,
          borderWidth: 2,
        ),
        SizedBox(height: 12.h),
        Text(
          l10n.onboardingTitle,
          textAlign: TextAlign.center,
          style: AppTypography.headlineXlMobile.copyWith(
            color: colors.textHigh,
          ),
        ),
        SizedBox(height: 4.h),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 280.w),
          child: Text(
            l10n.onboardingSubtitle,
            textAlign: TextAlign.center,
            style: AppTypography.bodyMd.copyWith(
              color: colors.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
