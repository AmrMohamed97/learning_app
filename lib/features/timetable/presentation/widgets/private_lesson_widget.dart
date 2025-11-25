import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/custom_cached_image.dart';
import 'package:talamiz_arina/core/widgets/my_button.dart';
import 'package:talamiz_arina/features/timetable/data/models/private_lesson.dart';
import 'package:talamiz_arina/features/timetable/presentation/widgets/lesson_details_bottom_sheet.dart';

class PrivateLessonWidget extends StatelessWidget {
  final PrivateLesson privateLesson;
  const PrivateLessonWidget({super.key, required this.privateLesson});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(8),
                child: CustomCachedImage(
                  width: 70,
                  height: 70,
                  url: privateLesson.teacher.profileImageUrl,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      privateLesson.teacher.name,
                      style: AppTextStyle.font16Medium,
                    ),
                    Text(
                      privateLesson.subject,
                      style: AppTextStyle.font14Regular,
                    ),
                    Text(
                      privateLesson.displyDate(),
                      style: AppTextStyle.font14Regular,
                    ),
                  ],
                ),
              ),
              Image.asset(width: 20, height: 20, Assets.assetsImagesPngTwoChat),
            ],
          ),
          const Gap(12),
          Row(
            children: [
              Expanded(
                child: Text(
                  DateFormat(
                    'EEEE d MMMM yyyy',
                  ).format(privateLesson.startTime),
                  style: AppTextStyle.font14Medium,
                ),
              ),
              _buildPrivateLessonState(
                privateLesson.startTime,
                privateLesson.endTime,
              ),
            ],
          ),
          const Divider(color: MyColors.greyLightActive, height: 32),
          Row(
            children: [
              if (privateLesson.endTime.isAfter(DateTime.now()))
                Expanded(
                  child: MyButton(text: "انضم الآن", onPressed: () {}),
                ),
              const SizedBox(width: 8),
              Expanded(
                child: MyButton(
                  color: Colors.transparent,
                  textColor: MyColors.purpleNormal,
                  borderColor: MyColors.purpleNormal,
                  text: "التفاصيل",
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => LessonDetailsBottomSheet(
                        privateLesson: privateLesson,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPrivateLessonState(DateTime startTime, DateTime endTime) {
    final data = startTime.isAfter(DateTime.now())
        ? ("قادمة", const Color(0xffCCFFD5), const Color(0xff068006))
        : (startTime.isBefore(DateTime.now()) &&
              endTime.isAfter(DateTime.now()))
        ? ("جارية", const Color(0xffFFF4CD), const Color(0xff8F7000))
        : ("منتهية", const Color(0xffFFCCCD), const Color(0xff800608));
    return Container(
      decoration: BoxDecoration(
        color: data.$2,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Text(
        data.$1,
        style: AppTextStyle.font14Regular.copyWith(color: data.$3),
      ),
    );
  }
}
