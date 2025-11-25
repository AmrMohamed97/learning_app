import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress/step_progress.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/features/onboarding/presentation/controller/onbording_controller.dart';
import 'package:talamiz_arina/features/onboarding/presentation/controller/onbording_state.dart';

class CustomSteper extends StatelessWidget {
  const CustomSteper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnbordingCubit, OnbordingState>(
      builder: (context, state) {
        final cubit = context.read<OnbordingCubit>();
        return StepProgress(
          currentStep: cubit.currentPage,
          totalSteps: 3,

          visibilityOptions: StepProgressVisibilityOptions.lineOnly,
          // controller: cubit.stepProgressController,
          highlightOptions:
              StepProgressHighlightOptions.highlightCompletedLines,
          onStepChanged: (currentIndex) {
            cubit.changePage(currentIndex);
          },
          // onStepLineTapped: (index) {
          //   debugPrint('onStepLineTapped: $index');
          // },
          theme: const StepProgressThemeData(
            stepLineSpacing: 6,
            defaultForegroundColor: MyColors.darkBlueOflight,
            activeForegroundColor: MyColors.purpleNormalHover,
            stepLineStyle: StepLineStyle(
              lineThickness: 9,
              borderRadius: Radius.circular(2),
            ),
          ),
        );
      },
    );
  }
}
