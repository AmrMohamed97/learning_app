import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/widgets/filter_container.dart';
import 'package:talamiz_arina/core/widgets/my_button.dart';
import 'package:talamiz_arina/features/courses/data/models/filter_course_model.dart';
import 'package:talamiz_arina/features/view_teachers/presentation/widgets/price_slider.dart';

class CoursesFilterPage extends StatefulWidget {
  final FilterCourseModel? filterCourseModel;
  const CoursesFilterPage({super.key, required this.filterCourseModel});

  @override
  State<CoursesFilterPage> createState() => _CoursesFilterPageState();
}

class _CoursesFilterPageState extends State<CoursesFilterPage> {
  late final FilterCourseModel filterCourseModel =
      widget.filterCourseModel?.copyWith() ??
      FilterCourseModel(
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
                context.pop(filterCourseModel);
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
                    values: widget.filterCourseModel?.priceRange
                        .toRangeValues(),
                    onStepChanged: (values) {
                      filterCourseModel.priceRange = PriceRange(
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

  bool _isChosen(dynamic value) {
    if (value is WeekDay) {
      return filterCourseModel.selectedDays.contains(value);
    } else if (value is Subject) {
      return filterCourseModel.selectedSubjects.contains(value);
    } else if (value is TeachingMethod) {
      return filterCourseModel.selectedTeachingMethod.contains(value);
    }
    return false;
  }

  void _toggleValue(dynamic value) {
    if (value is WeekDay) {
      if (_isChosen(value)) {
        filterCourseModel.selectedDays.remove(value);
      } else {
        filterCourseModel.selectedDays.add(value);
      }
    } else if (value is Subject) {
      if (_isChosen(value)) {
        filterCourseModel.selectedSubjects.remove(value);
      } else {
        filterCourseModel.selectedSubjects.add(value);
      }
    } else if (value is TeachingMethod) {
      if (_isChosen(value)) {
        filterCourseModel.selectedTeachingMethod.remove(value);
      } else {
        filterCourseModel.selectedTeachingMethod.add(value);
      }
    }
    setState(() {});
  }
}
