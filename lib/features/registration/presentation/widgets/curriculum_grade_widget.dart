import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:talamiz_arina/core/di/dependency_injection.dart';
import 'package:talamiz_arina/core/helper/font_weight_helper.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/custom_drop_down.dart';
import 'package:talamiz_arina/core/widgets/custom_error_widget.dart';
// import 'package:talamiz_arina/core/widgets/custom_error_widget.dart';
import 'package:talamiz_arina/features/registration/data/models/curreculum_out_model/curriculum_item.dart';
import 'package:talamiz_arina/features/registration/data/models/stages_out_model/stage_item.dart';
import 'package:talamiz_arina/features/registration/presentation/manager/registration_cubit.dart';
import 'package:talamiz_arina/features/registration/presentation/manager/stage_cubit/stage_cubit.dart';
import 'package:talamiz_arina/features/registration/presentation/manager/stage_cubit/stage_state.dart';

class CurriculumGradeWidget extends StatefulWidget {
  const CurriculumGradeWidget({super.key});

  @override
  State<CurriculumGradeWidget> createState() => _CurriculumGradeWidgetState();
}

class _CurriculumGradeWidgetState extends State<CurriculumGradeWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StageCubit>(),
      child: BlocBuilder<StageCubit, StageState>(
        builder: (context, state) {
          final cubit = context.read<StageCubit>();
          final registerCubit = context.read<RegistrationCubit>();
          return state is StageError || state is CurriculumError
              ? CustomErrorWidget(
                  errorMessage: 'oops there was an error try again later',
                  onPressed: () {
                    // context.read<StageCubit>().stagesOutModel = null;
                    // context.read<StageCubit>().getStages();
                  },
                )
              : Skeletonizer(
                  enabled: false,
                  // cubit.curriculumOutModel == null ||
                  // cubit.stagesOutModel == null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // if (widget.showTitle)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "نحتاج ان نعرف منهجك و صفك يا بطل",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeightHelper.semiBold,
                            ),
                          ),
                          Text(
                            "اختر  صفّك الدراسي والمنهج اللي تدرسه عشان نوصلك بالدروس المناسبة لك",
                            style: AppTextStyle.font16Regular,
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                      Text("المنهج", style: AppTextStyle.font16Medium),
                      const SizedBox(height: 12),
                      CustomDropDown(
                        value: registerCubit.selectedCrriculum,
                        validator: (value) {
                          if (value == null) {
                            return "اختر المنهج";
                          }
                          return null;
                        },
                        hintText: "اختر المنهج",
                        items:
                            cubit.curriculum
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      e,
                                      style: AppTextStyle.font16Regular
                                          .copyWith(
                                            fontFamily: 'sf-arabic-rounded',
                                          ),
                                    ),
                                  ),
                                )
                                .toList() ??
                            [],
                        onChanged: (value) {
                          setState(() {
                            if (value != null) {
                              registerCubit.curriculumController.text = 'd';
                              // registerCubit.selectedCrriculum = value;
                              // registerCubit.curriculumController.value =
                              //     TextEditingValue(text: value.name ?? '');
                            }
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      Text("الصف", style: AppTextStyle.font16Medium),
                      const SizedBox(height: 12),
                      CustomDropDown(
                        value: registerCubit.selectedStage,
                        validator: (value) {
                          if (value == null) {
                            return "اختر الصف";
                          }
                          return null;
                        },
                        hintText: "اختر الصف",
                        items:
                            cubit.stages.map((element) {
                              return DropdownMenuItem(
                                value: element,
                                child: Text(element),
                              );
                            }).toList() ??
                            [],
                        onChanged: (value) {
                          setState(() {
                            registerCubit.stageController.text = 'll';
                          });
                          // setState(() {
                          //   if (value != null) {
                          //     BlocProvider.of<RegistrationCubit>(
                          //       context,
                          //     ).selectedStage = value as StageItem?;

                          //     registerCubit.stageController.text =
                          //         BlocProvider.of<RegistrationCubit>(
                          //           context,
                          //         ).selectedStage!.name!;
                          //   }
                          // });
                        },
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
