import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/di/service_locator.dart';
import '../../logic/onboarding_cubit.dart';
import '../../logic/onboarding_state.dart';
import '../widgets/onboarding_body.dart';

/// Composition screen for Step 1 & 2 child onboarding.
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingCubit>(
      create: (_) => getIt<OnboardingCubit>()..initialize(),
      child: const _OnboardingView(),
    );
  }
}

class _OnboardingView extends StatefulWidget {
  const _OnboardingView();

  @override
  State<_OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<_OnboardingView> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'زيد');
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status == OnboardingStatus.ready &&
            _nameController.text != state.childName) {
          _nameController.text = state.childName;
        }
        if (state.status == OnboardingStatus.completed) {
          context.go('/journey');
        }
      },
      builder: (context, state) {
        final cubit = context.read<OnboardingCubit>();
        return Scaffold(
          body: OnboardingBody(
            nameController: _nameController,
            selectedAge: state.ageYears,
            selectedMascot: state.selectedMascot,
            pinFilledCount: state.pinFilledCount,
            isSubmitting: state.status == OnboardingStatus.submitting,
            onNameChanged: cubit.updateChildName,
            onSelectAge: cubit.selectAge,
            onSelectMascot: cubit.selectMascot,
            onTogglePinDot: cubit.togglePinDot,
            onStartPressed: cubit.completeOnboarding,
          ),
        );
      },
    );
  }
}
