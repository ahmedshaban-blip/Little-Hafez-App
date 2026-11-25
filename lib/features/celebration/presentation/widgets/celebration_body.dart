import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
import '../../domain/entities/completion_certificate.dart';
import 'celebration_actions_column.dart';
import 'celebration_header.dart';
import 'honor_certificate_card.dart';

/// Pure layout composition for Surah Completion Celebration screen.
class CelebrationBody extends StatelessWidget {
  const CelebrationBody({
    super.key,
    required this.certificate,
    required this.isPlayingRecitation,
    required this.onCloseTap,
    required this.onNextSurahTap,
    required this.onListenTap,
    required this.onShareTap,
  });

  final CompletionCertificate certificate;
  final bool isPlayingRecitation;
  final VoidCallback onCloseTap;
  final VoidCallback onNextSurahTap;
  final VoidCallback onListenTap;
  final VoidCallback onShareTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsetsDirectional.fromSTEB(
          AppSpacing.marginMobile.w,
          12.h,
          AppSpacing.marginMobile.w,
          28.h,
        ),
        child: Column(
          children: [
            CelebrationHeader(onCloseTap: onCloseTap),
            SizedBox(height: 18.h),
            HonorCertificateCard(certificate: certificate),
            SizedBox(height: 20.h),
            CelebrationActionsColumn(
              isPlayingRecitation: isPlayingRecitation,
              onNextSurahTap: onNextSurahTap,
              onListenTap: onListenTap,
              onShareTap: onShareTap,
            ),
          ],
        ),
      ),
    );
  }
}
