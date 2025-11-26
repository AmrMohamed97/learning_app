import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talamiz_arina/core/helper/font_weight_helper.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/my_text_form_field.dart';
import 'package:talamiz_arina/features/registration/presentation/manager/registration_cubit.dart';
import 'package:talamiz_arina/features/registration/presentation/manager/registration_state.dart';
import 'package:talamiz_arina/features/registration/presentation/widgets/image_dotted_border.dart';

class EnterNameImgWidget extends StatelessWidget {
  const EnterNameImgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "أول شئ نعرف اسمك",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeightHelper.semiBold,
              ),
            ),
            Text(
              "حمل صورتك واكتب اسمك عشان نجهز لك تجربة على قدك.",
              style: AppTextStyle.font16Regular,
            ),
            const SizedBox(height: 20),
            const Align(child: ImageDottedBorder()),
            const SizedBox(height: 20),
            Text("الإسم بالكامل", style: AppTextStyle.font16Medium),
            const SizedBox(height: 12),
            MyTextFormField(
              controller: BlocProvider.of<RegistrationCubit>(
                context,
              ).nameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "الحقل مطلوب";
                }
                if (value.length < 3) {
                  return "الحقل يجب ان يحتوي على 3 احرف على الأقل";
                }

                final RegExp regex = RegExp(r'^\S+(?:\s+\S+)+$');
                if (!regex.hasMatch(value)) {
                  return "يجب كتابة كلمتين على الأقل يفصل بينهما مسافة واحدة";
                }

                return null;
              },

              hintText: "اكتب اسمك",
            ),
          ],
        );
      },
    );
  }
}
