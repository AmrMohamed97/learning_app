import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';
import 'package:talamiz_arina/features/home/presentation/widgets/ad_widget.dart';
import 'package:talamiz_arina/features/home/presentation/widgets/courses_list.dart';
import 'package:talamiz_arina/features/home/presentation/widgets/teachers_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      backGroundColor: MyColors.darkBlueNormal,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 28),
              AdWidget(
                title: "لا تخلي شيء صعب يوقّفك!",
                description:
                    "احجز درسك مع أفضل المعلمين. أقصر طريق للدرجة اللي تحلم فيها.",
                buttonTitle: "اكتشف مدرّسك الخاص",
                onPressed: () {},
              ),
              const SizedBox(height: 24),
              const TeachersList(),
              const CoursesList(),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
