import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({
    this.validator,
    this.value,
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    required this.onChanged,
    required this.items,
  });
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(T?) onChanged;
  final List<DropdownMenuItem<T>> items;
  final String? Function(T?)? validator;
  final T? value;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      onChanged: onChanged,
      value: value,
      dropdownStyleData: DropdownStyleData(
        maxHeight: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: MyColors.greyLightHover),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
      decoration: secondryFormFieldDecoration(prefixIcon: prefixIcon),
      style: AppTextStyle.font16Regular.copyWith(
        color: Colors.black,
        fontFamily: 'sf-arabic-rounded',
      ),
      isExpanded: true,
      hint: Text(
        hintText,
        style: AppTextStyle.font16Regular.copyWith(
          fontFamily: 'sf-arabic-rounded',
        ),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(Icons.keyboard_arrow_down, size: 25),
      ),
      validator: validator,
      items: items,
    );
  }
}

InputDecoration secondryFormFieldDecoration({
  String? hintText,
  Widget? suffixIcon,
  Widget? prefixIcon,
}) {
  return InputDecoration(
    hintText: hintText,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: MyColors.darkBlueNormalActive,
        width: 2,
      ),
    ),
    errorStyle: AppTextStyle.font16Regular.copyWith(
      fontFamily: 'sf-arabic-rounded',
      color: Colors.red,
    ),
    hintStyle: AppTextStyle.font16Regular.copyWith(
      fontFamily: 'sf-arabic-rounded',
    ),
    border: InputBorder.none,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: MyColors.darkBlueNormalActive,
        width: 2,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: MyColors.darkBlueNormalActive,
        width: 2,
      ),
    ),
    filled: false,

    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: MyColors.darkBlueNormalActive,
        width: 2,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: MyColors.darkBlueNormalActive,
        width: 2,
      ),
    ),
    contentPadding: const EdgeInsets.all(15),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
  );
}
