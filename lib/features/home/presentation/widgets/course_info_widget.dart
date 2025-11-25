import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/avatar_stack.dart';
import 'package:talamiz_arina/core/widgets/custom_cached_image.dart';
import 'package:talamiz_arina/core/widgets/my_button.dart';
import 'package:talamiz_arina/features/home/presentation/widgets/courses_list.dart';

class CourseInfoWidget extends StatelessWidget {
  final Course course;
  const CourseInfoWidget({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            course.subject,
            style: AppTextStyle.font16Medium.copyWith(
              color: MyColors.darkBlueDarker,
            ),
          ),
          const SizedBox(height: 4),
          Text(course.title, style: AppTextStyle.font16SemiBold),
          const SizedBox(height: 12),
          Text("الجدول: ${course.schedule}", style: AppTextStyle.font14Regular),
          const SizedBox(height: 8),
          Row(
            children: [
              const AvatarStack(
                isNetworkImage: false,
                images: [
                  Assets.assetsImagesPngAvatar,
                  Assets.assetsImagesPngAvatar,
                  Assets.assetsImagesPngAvatar,
                ],
                avatarSize: 28,
                maxAvatars: 2,
              ),
              const SizedBox(width: 4),
              Text(
                "مقعد ${course.enrolledStudents}/${course.totalSeats}",
                style: AppTextStyle.font14Regular,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CustomCachedImage(
                  width: 50,
                  height: 50,
                  url: course.primaryInstructor!.profileImageUrl!,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.primaryInstructor!.name,
                      style: AppTextStyle.font16Regular,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 15),
                        const SizedBox(width: 2.5),
                        Text(
                          course.primaryInstructor!.rating.toString(),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                course.price.toStringAsFixed(2),
                style: AppTextStyle.font16SemiBold,
              ),
              Image.asset(Assets.assetsImagesPngSAR, width: 20, height: 20),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: MyButton(text: "احجز الآن", onPressed: () {}),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: MyButton(
                  color: Colors.transparent,
                  textColor: MyColors.purpleNormal,
                  borderColor: MyColors.purpleNormal,
                  text: "التفاصيل",
                  onPressed: () {
                    context.push(PagesKeys.coursePackagePage);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
