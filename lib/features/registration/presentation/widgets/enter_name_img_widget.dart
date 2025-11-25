import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/helper/font_weight_helper.dart';
import 'package:talamiz_arina/core/models/image_data.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/my_text_form_field.dart';
import 'package:talamiz_arina/features/registration/presentation/widgets/image_dotted_border.dart';

class EnterNameImgWidget extends StatelessWidget {
  final TextEditingController nameController;
  final ValueNotifier<ImageData?> image;
  const EnterNameImgWidget({
    super.key,
    required this.nameController,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "أول شئ نعرف اسمك",
          style: TextStyle(fontSize: 20, fontWeight: FontWeightHelper.semiBold),
        ),
          Text(
          "حمل صورتك واكتب اسمك عشان نجهز لك تجربة على قدك.",
          style: AppTextStyle.font16Regular,
        ),
        const SizedBox(height: 20),
        Align(child: ImageDottedBorder(image: image)),
        const SizedBox(height: 20),
          Text("الإسم بالكامل", style: AppTextStyle.font16Medium),
        const SizedBox(height: 12),
        MyTextFormField(
          controller: nameController,
          validator: (value) {
            if (value!.isEmpty) {
              return "الحقل مطلوب";
            }
            if (value.length < 3) {
              return "الحقل يجب ان يحتوي على 3 احرف على الأقل";
            }
            return null;
          },
          hintText: "اكتب اسمك",
        ),
      ],
    );
  }
}
