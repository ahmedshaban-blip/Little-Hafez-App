import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/theme.dart';

/// Offline-safe mascot/child avatar illustration matching Stitch characters.
enum MascotAvatarType { zayd, mariam, adam, noor }

/// Renders a crisp, kid-friendly character avatar using theme tokens.
class CustomAvatarIllustration extends StatelessWidget {
  const CustomAvatarIllustration({
    super.key,
    required this.type,
    this.size = 56,
    this.borderColor,
    this.borderWidth = 2,
  });

  final MascotAvatarType type;
  final double size;
  final Color? borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final bgColor = switch (type) {
      MascotAvatarType.zayd => colors.ceruleanFixed,
      MascotAvatarType.mariam => colors.pastelBlueSurface,
      MascotAvatarType.adam => colors.secondaryFixed,
      MascotAvatarType.noor => colors.skyBadgeBg,
    };
    final iconColor = switch (type) {
      MascotAvatarType.zayd => colors.ceruleanPrimary,
      MascotAvatarType.mariam => colors.brandSecondary,
      MascotAvatarType.adam => colors.brandPrimary,
      MascotAvatarType.noor => colors.skyBadgeText,
    };
    final iconData = switch (type) {
      MascotAvatarType.zayd => Icons.face_rounded,
      MascotAvatarType.mariam => Icons.face_3_rounded,
      MascotAvatarType.adam => Icons.face_6_rounded,
      MascotAvatarType.noor => Icons.auto_awesome_rounded,
    };

    return Container(
      width: size.r,
      height: size.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colors.surfaceContainerLowest,
        border: Border.all(
          color: borderColor ?? colors.ceruleanFixed,
          width: borderWidth,
        ),
        boxShadow: AppShadows.softCard(colors.shadowAmbient),
      ),
      padding: EdgeInsets.all(2.r),
      child: DecoratedBox(
        decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
        child: Icon(iconData, size: (size * 0.56).r, color: iconColor),
      ),
    );
  }
}
