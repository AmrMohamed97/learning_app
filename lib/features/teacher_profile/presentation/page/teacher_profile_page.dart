import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';
import 'package:talamiz_arina/features/teacher_profile/presentation/manager/teacher_cubit.dart';
import 'package:talamiz_arina/features/teacher_profile/presentation/manager/teacher_state.dart';
import 'package:talamiz_arina/features/teacher_profile/presentation/view/about_view.dart';
import 'package:talamiz_arina/core/widgets/action_button_view.dart';
import 'package:talamiz_arina/features/teacher_profile/presentation/view/biography_view.dart';
import 'package:talamiz_arina/features/teacher_profile/presentation/view/booking_schedule.dart';
import 'package:talamiz_arina/features/teacher_profile/presentation/view/teacher_app_bar.dart';
import 'package:talamiz_arina/features/teacher_profile/presentation/view/teacher_info_view.dart';
import 'package:talamiz_arina/features/teacher_profile/presentation/widgets/custom_tap_bar.dart';
import 'package:talamiz_arina/features/teacher_profile/presentation/widgets/custom_tap_view.dart';

class TeacherProfilePage extends StatelessWidget {
  const TeacherProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeacherCubit, TeacherState>(
      builder: (context, state) {
        // return DatePickerScreen();
        return DefaultTabController(
          length: 3,
          child: ScreenWrapper(
            backGroundColor: Colors.white,
            bottomNavigationBar: const ActionButtonView(),
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                TeacherAppBar(
                  video: 'https://www.youtube.com/watch?v=aieYzMVnMvU',
                  onFavorite: () {},
                ),
                const TeacherInfoView(),
                const CustomTapBar(
                  tabs: [
                    Tab(text: 'عن المعلم'),
                    Tab(text: 'جدول الحجز'),
                    Tab(text: 'السير الذاتية'),
                  ],
                ),
              ],
              body: const CustomTapView(
                tabs: [AboutView(), Bookingschedule(), BiographyView()],
              ),
            ),
          ),
        );
      },
    );
  }
}
