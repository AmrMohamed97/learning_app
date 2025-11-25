import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/helper/font_weight_helper.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/features/registration/presentation/widgets/custom_list_tile.dart';

class GenderRadioGroup extends StatefulWidget {
  final ValueNotifier<String?> gender;
  final bool showTitle;
  const GenderRadioGroup({
    super.key,
    required this.gender,
    this.showTitle = true,
  });

  @override
  State<GenderRadioGroup> createState() => _GenderRadioGroupState();
}

class _GenderRadioGroupState extends State<GenderRadioGroup> {
  final String male = "ذكر";
  final String female = "انثى";
  late String? _selectedGender = widget.gender.value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showTitle)
          Column(
            crossAxisAlignment: .start,
            children: [
              const Text(
                "عرفنا اسمك .. الحين اختر جنسَك",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
              Text(
                "عشان نضبط لك المحتوى بالطريقة اللي تناسبك",
                style: AppTextStyle.font16Regular,
              ),
              const SizedBox(height: 20),
            ],
          ),
        RadioGroup(
          key: UniqueKey(),
          groupValue: _selectedGender,
          onChanged: (value) {
            setState(() {
              _selectedGender = value;
              widget.gender.value = value;
            });
          },
          child: Column(
            children: [
              CustomListTile(
                value: male,
                title: Text(
                  male,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: _selectedGender == male
                        ? MyColors.purpleNormalActive
                        : MyColors.darkBlueDarkHover,
                  ),
                ),
                isSelected: _selectedGender == male,
                onTap: () {
                  setState(() {
                    _selectedGender = male;
                    widget.gender.value =male;
                  });
                },
              ),
              const SizedBox(height: 16),
              CustomListTile(
                value: female,
                title: Text(
                  female,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: _selectedGender == female
                        ? MyColors.purpleNormalActive
                        : MyColors.darkBlueDarkHover,
                  ),
                ),
                isSelected: _selectedGender == female,
                onTap: () {
                  setState(() {
                    _selectedGender = female;
                    widget.gender.value = female;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget buildRadioListTile(String value, String title) {
  //   return RadioListTile(
  //     selectedTileColor: MyColors.purpleNormalActive,
  //     radioScaleFactor: 1.2,
  //     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  //     controlAffinity: ListTileControlAffinity.trailing,
  //     contentPadding: const EdgeInsets.symmetric(horizontal: 16),
  //     value: value,
  //     title: Text(title),
  //     tileColor: _selectedGender == value
  //         ? MyColors.purpleLightHover
  //         : Colors.transparent,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(8),
  //       side: BorderSide(
  //         color: _selectedGender == value
  //             ? MyColors.purpleNormalActive
  //             : MyColors.darkBlueDarkHover,
  //         width: 2,
  //       ),
  //     ),
  //   );
  // }
}
