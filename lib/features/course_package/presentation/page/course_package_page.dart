import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/widgets/action_button_view.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';
import 'package:talamiz_arina/features/course_package/presentation/manager/course_package_cubit.dart';
import 'package:talamiz_arina/features/course_package/presentation/manager/course_package_state.dart';
import 'package:talamiz_arina/features/course_package/presentation/view/about_course_teacher.dart';
import 'package:talamiz_arina/features/course_package/presentation/view/about_package.dart';
import 'package:talamiz_arina/features/course_package/presentation/view/course_package_app_bar.dart';
import 'package:talamiz_arina/features/course_package/presentation/view/curriculum_view.dart';
import 'package:talamiz_arina/features/course_package/presentation/view/course_package_info_view.dart';
import 'package:talamiz_arina/features/course_package/presentation/view/reviews_view.dart';
import 'package:talamiz_arina/features/teacher_profile/presentation/widgets/custom_tap_bar.dart';
import 'package:talamiz_arina/features/teacher_profile/presentation/widgets/custom_tap_view.dart';

class CoursePackagePage extends StatelessWidget {
  const CoursePackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursePackageCubit, CoursePackageState>(
      builder: (context, state) {
        // return DatePickerScreen();
        return DefaultTabController(
          length: 4,
          child: ScreenWrapper(
            resizeToAvoidBottomInset: false,
            backGroundColor: Colors.white,
            bottomNavigationBar: ActionButtonView(
              onReserve: () {
                context.push(PagesKeys.assignReserveDateTimePage);
              },
            ),
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                CoursePackageAppBar(
                  video: 'https://www.youtube.com/watch?v=aieYzMVnMvU',
                  onFavorite: () {
                    // print('lkjjjjjjjjjjjjj============================');
                  },
                ),
                const CoursePackageInfoView(),
                const CustomTapBar(
                  tabs: [
                    Tab(text: 'عن الباقه'),
                    Tab(text: 'المنهج'),
                    Tab(text: 'عن المعلم'),
                    Tab(text: 'الآراء'),
                  ],
                ),
              ],
              body: const CustomTapView(
                tabs: [
                  AboutPackage(),
                  CurriculumView(),
                  AboutCourseTeacher(),
                  ReviewsView(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
