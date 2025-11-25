import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/filter_tages_row.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';
import 'package:talamiz_arina/core/widgets/search_field.dart';
import 'package:talamiz_arina/features/timetable/data/models/timetable_filter_model.dart';
import 'package:talamiz_arina/features/timetable/presentation/manager/timetable_cubit.dart';
import 'package:talamiz_arina/features/timetable/presentation/widgets/timetable_group_classes_list.dart';
import 'package:talamiz_arina/features/timetable/presentation/widgets/timetable_packages_list.dart';
import 'package:talamiz_arina/features/timetable/presentation/widgets/timetable_private_lesson_list.dart';

class TimetablePage extends StatefulWidget {
  const TimetablePage({super.key});

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  late final TimetableCubit _coursesCubit = context.read();

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      body: DefaultTabController(
        length: 3,
        child: Column(
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
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: SearchField(controller: TextEditingController()),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      context
                          .push(
                            PagesKeys.filterCoursePageKey,
                            extra: _coursesCubit.filter.value,
                          )
                          .then((value) {
                            if (value is TimetableFilterModel) {
                              if (value.isEmpty()) {
                                _coursesCubit.filter.value = null;
                              } else {
                                _coursesCubit.filter.value = value.copyWith();
                              }
                            }
                          });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.asset(Assets.assetsImagesSvgFilter),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            TabBar(
              labelPadding: const EdgeInsets.all(0),
              indicatorColor: MyColors.purpleNormalHover,
              indicatorWeight: 1,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: MyColors.purpleNormalHover,
              labelStyle: AppTextStyle.font16SemiBold.copyWith(
                color: MyColors.purpleNormalHover,
                fontFamily: "sf-arabic-rounded",
              ),
              tabs: const [
                Tab(text: "دروس خصوصية"),
                Tab(text: "باقات دراسية"),
                Tab(text: "فصول جماعية"),
              ],
            ),
            const SizedBox(height: 16),
            const Expanded(
              child: TabBarView(
                children: [
                  TimetablePrivateLessonList(),
                  TimetableGroupClassesList(),
                  TimetablePackagesList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
