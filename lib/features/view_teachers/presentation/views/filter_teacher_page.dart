import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/filter_container.dart';
import 'package:talamiz_arina/core/widgets/my_button.dart';
import 'package:talamiz_arina/features/view_teachers/data/models/filter_teacher_model.dart';
import 'package:talamiz_arina/features/view_teachers/presentation/widgets/price_slider.dart';

class FilterTeacherPage extends StatefulWidget {
  final FilterTeacherModel? filterTeacherModel;
  const FilterTeacherPage({super.key, required this.filterTeacherModel});

  @override
  State<FilterTeacherPage> createState() => _FilterTeacherPageState();
}

class _FilterTeacherPageState extends State<FilterTeacherPage> {
  late final FilterTeacherModel filterTeacherModel =
      widget.filterTeacherModel?.copyWith() ??
      FilterTeacherModel(
        morningSlots: [],
        eveningSlots: [],
        selectedDays: {},
        selectedSubjects: {},
        priceRange: PriceRange(minPrice: 100, maxPrice: 2000),
        selectedTeachingMethod: [],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkBlueNormal,
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 20,
            top: 5,
          ),
          child: FractionallySizedBox(
            widthFactor: (700 / MediaQuery.of(context).size.width).clamp(0, 1),
            child: MyButton(
              text: "اكتشف مدرّسك الخاص",
              onPressed: () {
                context.pop(filterTeacherModel);
              },
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("تصفية المعلمين"),
        centerTitle: true,
        actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 28),
                  _buildFilterTimeSlotsContainer(),
                  const SizedBox(height: 16),
                  FilterContainer<WeekDay>(
                    title: "الايام المتوفرة",
                    items: WeekDay.values
                        .map((day) => (day.nameArabic, day))
                        .toList(),
                    isChosen: _isChosen,
                    onToggle: _toggleValue,
                  ),
                  const SizedBox(height: 16),
                  FilterContainer<Subject>(
                    title: "المواد الدراسية",
                    items: Subject.values
                        .map((subject) => (subject.nameArabic, subject))
                        .toList(),
                    isChosen: _isChosen,
                    onToggle: _toggleValue,
                  ),
                  const SizedBox(height: 16),
                  PriceSlider(
                    values: widget.filterTeacherModel?.priceRange
                        .toRangeValues(),
                    onStepChanged: (values) {
                      filterTeacherModel.priceRange = PriceRange(
                        minPrice: values.start.toInt(),
                        maxPrice: values.end.toInt(),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  FilterContainer<TeachingMethod>(
                    title: "كيف تبغى المعلم يتكلم؟",
                    items: TeachingMethod.values
                        .map((method) => (method.nameArabic, method))
                        .toList(),
                    isChosen: _isChosen,
                    onToggle: _toggleValue,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterTimeSlotsContainer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text("الأوقات المتوفرة", style: AppTextStyle.font20SemiBold),
          const SizedBox(height: 10),
          FilterContainer<TimeSlot>(
            title: "خلال فترات النهار",
            items: List.generate(12, (index) {
              final timeSlot = TimeSlot(
                startTime: (index + 1).toString(),
                endTime: (index + 2).toString(),
                amPm: "ص",
              );
              return (timeSlot.displayTime, timeSlot);
            }).toList(),
            isChosen: _isChosen,
            onToggle: (value) {
              _toggleValue(value);
            },
            icon: Icons.wb_sunny_outlined,
            horizontal: true,
          ),
          const Divider(color: MyColors.darkBlueNormalHover, thickness: 2),
          FilterContainer<TimeSlot>(
            title: "خلال فترات الليل",
            items: List.generate(12, (index) {
              final timeSlot = TimeSlot(
                startTime: (index + 1).toString(),
                endTime: (index + 2).toString(),
                amPm: "م",
              );
              return (timeSlot.displayTime, timeSlot);
            }).toList(),
            isChosen: _isChosen,
            onToggle: (value) {
              _toggleValue(value);
            },
            icon: Icons.nightlight_round_outlined,
            horizontal: true,
          ),
        ],
      ),
    );
  }

  bool _isChosen(dynamic value) {
    if (value is WeekDay) {
      return filterTeacherModel.selectedDays.contains(value);
    } else if (value is Subject) {
      return filterTeacherModel.selectedSubjects.contains(value);
    } else if (value is TimeSlot) {
      if (value.amPm == "ص") {
        return filterTeacherModel.morningSlots.contains(value);
      } else {
        return filterTeacherModel.eveningSlots.contains(value);
      }
    } else if (value is TeachingMethod) {
      return filterTeacherModel.selectedTeachingMethod.contains(value);
    }
    return false;
  }

  void _toggleValue(dynamic value) {
    if (value is WeekDay) {
      if (_isChosen(value)) {
        filterTeacherModel.selectedDays.remove(value);
      } else {
        filterTeacherModel.selectedDays.add(value);
      }
    } else if (value is Subject) {
      if (_isChosen(value)) {
        filterTeacherModel.selectedSubjects.remove(value);
      } else {
        filterTeacherModel.selectedSubjects.add(value);
      }
    } else if (value is TimeSlot) {
      if (value.amPm == "ص") {
        if (_isChosen(value)) {
          filterTeacherModel.morningSlots.remove(value);
        } else {
          filterTeacherModel.morningSlots.add(value);
        }
      } else {
        if (_isChosen(value)) {
          filterTeacherModel.eveningSlots.remove(value);
        } else {
          filterTeacherModel.eveningSlots.add(value);
        }
      }
    } else if (value is TeachingMethod) {
      if (_isChosen(value)) {
        filterTeacherModel.selectedTeachingMethod.remove(value);
      } else {
        filterTeacherModel.selectedTeachingMethod.add(value);
      }
    }
    setState(() {});
  }
}
