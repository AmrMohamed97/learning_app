import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/filter_tages_row.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';
import 'package:talamiz_arina/features/courses/presentation/manager/courses_cubit.dart';
import 'package:talamiz_arina/features/courses/presentation/widgets/courses_packages_list.dart';
import 'package:talamiz_arina/features/courses/presentation/widgets/group_classes_list.dart';
import 'package:talamiz_arina/features/courses/presentation/widgets/home_app_bar_with_filter.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  late final CoursesCubit _coursesCubit = context.read();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      appBar: const HomeAppBarWithFilter(),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: _coursesCubit.filter,
            builder: (context, value, child) {
              List<String> tages = [];
              if (value != null) {
                tages = [
                  ...value.selectedDays.map((e) => e.nameArabic),
                  ...value.selectedSubjects.map((e) => e.nameArabic),
                  ...value.selectedTeachingMethod.map((e) => e.nameArabic),
                  if (!(value.priceRange.minPrice == 100 &&
                      value.priceRange.maxPrice == 2000))
                    '\u200E${value.priceRange.minPrice} SAR - ${value.priceRange.maxPrice} SAR\u200E',
                ];
              }
              return FilterTagesRow(
                tages: tages,
                onClose: () {
                  _coursesCubit.filter.value = null;
                },
              );
            },
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomSlidingSegmentedControl<int>(
              height: 52,
              innerPadding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 5,
              ),
              isStretch: true,
              initialValue: 0,
              children: {
                0: Text(
                  "باقات دراسية",
                  style: AppTextStyle.font16Bold.copyWith(
                    color: currentIndex == 0
                        ? MyColors.purpleNormal
                        : Colors.black,
                  ),
                ),
                1: Text(
                  "فصول جماعية",
                  style: AppTextStyle.font16Bold.copyWith(
                    color: currentIndex == 1
                        ? MyColors.purpleNormal
                        : Colors.black,
                  ),
                ),
              },
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              thumbDecoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: MyColors.purpleNormal, width: 2),
              ),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInToLinear,
              onValueChanged: (v) {
                setState(() {
                  currentIndex = v;
                });
              },
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: currentIndex == 0
                ? const CoursesPackagesList()
                : const GroupClassesList(),
          ),
        ],
      ),
    );
  }
}
