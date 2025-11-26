import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talamiz_arina/core/const/enums.dart';
import 'package:talamiz_arina/core/helper/font_weight_helper.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/features/registration/presentation/manager/registration_cubit.dart';
import 'package:talamiz_arina/features/registration/presentation/manager/registration_state.dart';
import 'package:talamiz_arina/features/registration/presentation/widgets/custom_list_tile.dart';

class GenderRadioGroup extends StatefulWidget {
  const GenderRadioGroup({super.key});

  @override
  State<GenderRadioGroup> createState() => _GenderRadioGroupState();
}

class _GenderRadioGroupState extends State<GenderRadioGroup> {
  final Gender male = Gender.male;
  final Gender female = Gender.female;
  // late Gender? cubit.gender.value = widget.gender.value ;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        final cubit = context.read<RegistrationCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            RadioGroup<Gender>(
              key: UniqueKey(),
              groupValue: cubit.gender.value,
              onChanged: (value) {
                setState(() {
                  cubit.gender.value = value;
                  cubit.gender.value = value;
                });
              },
              child: Column(
                children: [
                  CustomListTile<Gender>(
                    value: male,
                    title: Text(
                      'ذكر',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: cubit.gender.value == Gender.male
                            ? MyColors.purpleNormalActive
                            : MyColors.darkBlueDarkHover,
                      ),
                    ),
                    isSelected: cubit.gender.value == Gender.male,
                    onTap: () {
                      setState(() {
                        cubit.gender.value = Gender.male;
                        cubit.gender.value = Gender.male;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomListTile<Gender>(
                    value: female,
                    title: Text(
                      'انثى',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: cubit.gender.value == Gender.female
                            ? MyColors.purpleNormalActive
                            : MyColors.darkBlueDarkHover,
                      ),
                    ),
                    isSelected: cubit.gender.value == Gender.female,
                    onTap: () {
                      setState(() {
                        cubit.gender.value = Gender.female;
                        cubit.gender.value = Gender.female;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
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
  //     tileColor: cubit.gender.value == value
  //         ? MyColors.purpleLightHover
  //         : Colors.transparent,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(8),
  //       side: BorderSide(
  //         color: cubit.gender.value == value
  //             ? MyColors.purpleNormalActive
  //             : MyColors.darkBlueDarkHover,
  //         width: 2,
  //       ),
  //     ),
  //   );
  // }
}
