import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/my_text_form_field.dart';
import 'package:talamiz_arina/features/edit_auth_info/presentation/manager/edit_auth_info_cubit.dart';

class UpdatePasswordFields extends StatelessWidget {
  const UpdatePasswordFields({super.key});

  @override
  Widget build(BuildContext context) {
    final EditAuthInfoCubit cubit = context.read<EditAuthInfoCubit>();
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildFieldWithTitle(
            title: "كلمة المرور الحالية",
            field: MyTextFormField(
              obscureText: true,
              controller: cubit.currentPasswordController,
            ),
          ),
          _buildFieldWithTitle(
            title: "كلمة المرور الجديدة",
            field: MyTextFormField(
              obscureText: true,
              controller: cubit.newPasswordController,
            ),
          ),
          _buildFieldWithTitle(
            title: "تأكيد كلمة المرور الجديدة",
            field: MyTextFormField(
              obscureText: true,
              controller: cubit.confirmNewPasswordController,
              validator: (value) {
                if (cubit.confirmNewPasswordController.text !=
                    cubit.newPasswordController.text) {
                  return "كلمات المرور غير متطابقة";
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFieldWithTitle({
    required String title,
    required Widget field,
    Key? key,
  }) {
    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(title, style: AppTextStyle.font16Medium),
        const SizedBox(height: 12),
        field,
      ],
    );
  }
}
