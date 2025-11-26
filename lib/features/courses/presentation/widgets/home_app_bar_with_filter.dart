
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/helper/countries_codes.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/features/courses/data/models/filter_course_model.dart';
import 'package:talamiz_arina/features/courses/presentation/manager/courses_cubit.dart';
import 'package:talamiz_arina/features/courses/presentation/manager/courses_state.dart';

class HomeAppBarWithFilter extends StatelessWidget
    implements PreferredSizeWidget {
  const HomeAppBarWithFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesCubit, CoursesState>(
      builder: (context, state) {
        final coursesCubit = context.read<CoursesCubit>();
        return AppBar(
          centerTitle: context.canPop(),
          title: context.canPop()
              ? const Text("الدورات")
              : SvgPicture.asset(height: 35, Assets.assetsImagesSvgLogoHeading),
          actions: [
            if (!context.canPop())
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: MyColors.purpleLightActive,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SvgPicture.asset(
                      Assets.assetsImagesSvgNotifications,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: MyColors.purpleLightActive,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SvgPicture.asset(Assets.assetsImagesSvgPerson),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            GestureDetector(
              onTap: () {
                context
                    .push(
                      PagesKeys.filterCoursePageKey,
                      extra: coursesCubit.filter.value,
                    )
                    .then((value) {
                      if (value is FilterCourseModel) {
                        if (value.isEmpty()) {
                          coursesCubit.filter.value = null;
                        } else {
                          coursesCubit.filter.value = value.copyWith();
                        }
                      }
                    });
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: MyColors.purpleLightActive,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SvgPicture.asset(Assets.assetsImagesSvgFilter),
              ),
            ),
          ],
          bottom: context.canPop()
              ? null
              : PreferredSize(
                  preferredSize: const Size.fromHeight(40),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 8,
                      bottom: 12,
                    ),
                    child: Text(
                      textAlign: TextAlign.start,
                      "${countryCodeToEmoji("EG")} الثالث ثانوي - علمي علوم",
                      style: AppTextStyle.font16Medium,
                    ),
                  ),
                ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 45);
}
