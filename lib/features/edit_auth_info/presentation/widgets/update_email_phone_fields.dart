import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/utills/validator.dart';
import 'package:talamiz_arina/core/widgets/my_phone_number_form_field.dart';
import 'package:talamiz_arina/core/widgets/my_text_form_field.dart';
import 'package:talamiz_arina/features/edit_auth_info/presentation/manager/edit_auth_info_cubit.dart';

class UpdateEmailPhoneFields extends StatelessWidget {
  const UpdateEmailPhoneFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildFieldWithTitle(
            title: "البريد الالكتروني",
            field: MyTextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "هذا الحقل مطلوب";
                }
                if (!Validator.validateEmail(value)) {
                  return "تأكد من كتابة البريد الإلكتروني بشكل صحيح.";
                }
                return null;
              },
              controller: context
                  .read<EditAuthInfoCubit>()
                  .emailPasswordController,
              hintText: "ادخل البريد الالكتروني",
              suffixIcon: GestureDetector(
                onTap: () {},
                child: Text(
                  "تغيير",
                  style: AppTextStyle.font16Medium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          _buildFieldWithTitle(
            title: "رقم الموبايل",
            field: MyPhoneNumberFormField(
              controller: context
                  .read<EditAuthInfoCubit>()
                  .phonePasswordController,
              hintText: "ادخل رقم الموبايل",
              suffixIcon: GestureDetector(
                onTap: () {},
                child: Text(
                  "تغيير",
                  style: AppTextStyle.font16Medium,
                  textAlign: TextAlign.center,
                ),
              ),
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
