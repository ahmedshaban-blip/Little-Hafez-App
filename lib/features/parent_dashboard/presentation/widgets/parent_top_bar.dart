import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/l10n_extension.dart';

/// Top bar for the Parent Zone with shield icon, title, and PIN lock button.
class ParentTopBar extends StatelessWidget {
  const ParentTopBar({super.key, required this.onPinLockTap});

  final VoidCallback onPinLockTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = context.l10n;

    return Container(
      padding: EdgeInsetsDirectional.only(
        start: AppSpacing.marginMobile.w,
        end: AppSpacing.marginMobile.w,
        top: MediaQuery.paddingOf(context).top + 8.h,
        bottom: 12.h,
      ),
      decoration: BoxDecoration(
        color: colors.surface.withValues(alpha: 0.94),
        border: Border(bottom: BorderSide(color: colors.borderHairline)),
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
                    Icons.admin_panel_settings_rounded,
                    size: 22.r,
                    color: colors.brandSecondary,
                  ),
                ),
                SizedBox(width: 10.w),
                Flexible(
                  child: Text(
                    l10n.parentTitle,
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
          InkWell(
            onTap: onPinLockTap,
            borderRadius: AppRadii.borderFull,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
              decoration: BoxDecoration(
                color: colors.surfaceContainerHigh,
                borderRadius: AppRadii.borderFull,
                border: Border.all(color: colors.borderSubtle),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.lock_rounded, size: 17.r, color: colors.error),
                  SizedBox(width: 6.w),
                  Text(
                    l10n.parentPinLock,
                    style: AppTypography.labelMd.copyWith(
                      color: colors.textHigh,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
