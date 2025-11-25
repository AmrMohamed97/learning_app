import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/helper/countries_codes.dart';
import 'package:talamiz_arina/core/helper/font_weight_helper.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/custom_drop_down.dart';

class CurriculumGradeWidget extends StatefulWidget {
  final TextEditingController crriculumController;
  final TextEditingController gradeController;
  final bool showTitle;
  const CurriculumGradeWidget({
    super.key,
    required this.crriculumController,
    required this.gradeController,
    this.showTitle = true,
  });

  @override
  State<CurriculumGradeWidget> createState() => _CurriculumGradeWidgetState();
}

class _CurriculumGradeWidgetState extends State<CurriculumGradeWidget> {
  final _curricula = [
    "${countryCodeToEmoji("EG")} المنهج المصري",
    "${countryCodeToEmoji("SA")} المنهج السعودي",
  ];
  late String? _selectedCrriculum = widget.crriculumController.text.isNotEmpty
      ? widget.crriculumController.text
      : null;
  final List<String> _saudiGradesArabic = [
    "رياض الأطفال",
    "الصف الأول",
    "الصف الثاني",
    "الصف الثالث",
    "الصف الرابع",
    "الصف الخامس",
    "الصف السادس",
    "الصف السابع",
    "الصف الثامن",
    "الصف التاسع",
    "الصف العاشر",
    "الصف الحادي عشر",
    "الصف الثاني عشر",
  ];

  final List<String> _egyptGradesArabic = [
    "رياض الأطفال",
    "الصف الأول الابتدائي",
    "الصف الثاني الابتدائي",
    "الصف الثالث الابتدائي",
    "الصف الرابع الابتدائي",
    "الصف الخامس الابتدائي",
    "الصف السادس الابتدائي",
    "الصف الأول الإعدادي",
    "الصف الثاني الإعدادي",
    "الصف الثالث الإعدادي",
    "الصف الأول الثانوي",
    "الصف الثاني الثانوي",
    "الصف الثالث الثانوي",
  ];

  late String? _selectedgrade = widget.gradeController.text.isNotEmpty
      ? widget.gradeController.text
      : null;

  @override
  void initState() {
    print("grade ${widget.gradeController.text}");
    print("crriculum ${widget.crriculumController.text}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showTitle)
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
          value: _selectedCrriculum,
          validator: (value) {
            if (value == null) {
              return "اختر المنهج";
            }
            return null;
          },
          hintText: "اختر المنهج",
          items: _curricula
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: AppTextStyle.font16Regular.copyWith(
                      fontFamily: 'sf-arabic-rounded',
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              if (value != null) {
                _selectedCrriculum = value;
                widget.crriculumController.value = TextEditingValue(
                  text: value,
                );
              }
            });
          },
        ),
        const SizedBox(height: 16),
        Text("الصف", style: AppTextStyle.font16Medium),
        const SizedBox(height: 12),
        CustomDropDown(
          value: _selectedgrade,
          validator: (value) {
            if (value == null) {
              return "اختر الصف";
            }
            return null;
          },
          hintText: "اختر الصف",
          items: _selectedCrriculum == _curricula.first
              ? _egyptGradesArabic
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList()
              : _saudiGradesArabic
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
          onChanged: (value) {
            setState(() {
              if (value != null) {
                _selectedgrade = value;
                widget.gradeController.value = TextEditingValue(text: value);
              }
            });
          },
        ),
      ],
    );
  }
}
