import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/custom_cached_image.dart';
import 'package:talamiz_arina/core/widgets/my_button.dart';
import 'package:talamiz_arina/features/timetable/data/models/private_lesson.dart';

class LessonDetailsBottomSheet extends StatelessWidget {
  final PrivateLesson privateLesson;
  const LessonDetailsBottomSheet({super.key, required this.privateLesson});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                const Gap(4),
                Row(
                  children: [
                    Text("تفاصيل الدرس", style: AppTextStyle.font16Medium),
                    const Spacer(),
                    Image.asset(
                      width: 20,
                      height: 20,
                      Assets.assetsImagesPngTwoChat,
                    ),
                  ],
                ),
                const Gap(16),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CustomCachedImage(
                        width: 60,
                        height: 60,
                        url: privateLesson.teacher.profileImageUrl,
                      ),
                    ),
                    const Gap(8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              privateLesson.teacher.name,
                              style: AppTextStyle.font16Medium,
                            ),
                            const Gap(8),
                            Image.asset(
                              width: 20,
                              height: 20,
                              Assets.assetsImagesPngVerified,
                            ),
                          ],
                        ),
                        Text(
                          privateLesson.subject,
                          style: AppTextStyle.font16Medium,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Image.asset(
                          width: 20,
                          height: 20,
                          Assets.assetsImagesPngSAR,
                        ),
                        const Gap(8),
                        Text("50", style: AppTextStyle.font20SemiBold),
                      ],
                    ),
                  ],
                ),
                const Divider(color: MyColors.greyLightActive, height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _builedColoredContainer(
                      title: privateLesson.getLessonState(),
                      color: const Color(0xff6B00A1),
                    ),
                    _builedColoredContainer(
                      title:
                          "${privateLesson.endTime.difference(privateLesson.startTime).inMinutes} دقيقة",
                      color: Colors.green,
                    ),
                    _builedColoredContainer(
                      title: privateLesson.subject,
                      color: const Color(0xff026AA2),
                    ),
                    _builedColoredContainer(
                      title: "حصة فردية",
                      color: const Color(0xff8F7000),
                    ),
                  ],
                ),
                const Divider(color: MyColors.greyLightActive, height: 32),
                RichText(
                  text: TextSpan(
                    text: "الملاحظات:\n",
                    style: AppTextStyle.font16Medium.copyWith(
                      color: Colors.black,
                      fontFamily: 'sf-arabic-rounded',
                      height: 1.7,
                    ),
                    children: [
                      TextSpan(
                        text: privateLesson.notes,
                        style: AppTextStyle.font16Regular.copyWith(
                          color: Colors.black,
                          fontFamily: 'sf-arabic-rounded',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: MyButton(
                  text: "انضم الآن",
                  onPressed: privateLesson.getLessonState() == "قادمة"
                      ? () {}
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _builedColoredContainer({
    required String title,
    required Color color,
  }) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: color.withValues(alpha: .2),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Text(
          title,
          style: AppTextStyle.font14Medium.copyWith(color: color),
        ),
      ),
    );
  }
}
