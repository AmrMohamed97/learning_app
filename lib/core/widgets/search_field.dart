import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/widgets/my_text_form_field.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  const SearchField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return MyTextFormField(
      filledColor: Colors.white,
      filled: true,
      controller: controller,
      hintText: 'ابحث بالكلمات الدالة',
      suffixIcon: SvgPicture.asset(Assets.assetsImagesSvgSearch),
    );
  }
}
