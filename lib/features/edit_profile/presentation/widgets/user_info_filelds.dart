import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/my_text_form_field.dart';
import 'package:talamiz_arina/features/edit_profile/presentation/manager/edit_profile_cubit.dart';
import 'package:talamiz_arina/features/registration/presentation/widgets/curriculum_grade_widget.dart';
import 'package:talamiz_arina/features/registration/presentation/widgets/gender_radio_group.dart';

class UserInfoFilelds extends StatelessWidget {
  const UserInfoFilelds({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          _buildFiledWithTitle(
            title: "الإسم بالكامل",
            child: MyTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "هذا الحقل مطلوب";
                } else if (value.length < 3) {
                  return "الإسم 3 أحرف أو أكثر";
                }
                return null;
              },
              hintText: "اكتب اسمك",
              controller: context.read<EditProfileCubit>().nameController,
            ),
          ),
          const SizedBox(height: 16),
          CurriculumGradeWidget(
            crriculumController: context
                .read<EditProfileCubit>()
                .curriculumController,
            gradeController: context.read<EditProfileCubit>().gradeController,
            showTitle: false,
          ),
          const SizedBox(height: 16),
          _buildFiledWithTitle(
            title: "النوع",
            child: GenderRadioGroup(
              gender: context.read<EditProfileCubit>().genderValueNotifier,
              showTitle: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFiledWithTitle({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: .start,

      children: [
        Text(title, style: AppTextStyle.font16Medium),
        const SizedBox(height: 12),
        child,
      ],
    );
  }
}
