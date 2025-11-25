import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/custom_cached_image.dart';
import 'package:talamiz_arina/features/home/presentation/widgets/teachers_list.dart';

class TeacherWidget extends StatefulWidget {
  final Teacher teacher;
  const TeacherWidget({super.key, required this.teacher});

  @override
  State<TeacherWidget> createState() => _TeacherWidgetState();
}

class _TeacherWidgetState extends State<TeacherWidget> {
  late bool isFavorite = widget.teacher.isFavorite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(PagesKeys.teacherProfilePage);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CustomCachedImage(
                      url: widget.teacher.profileImageUrl!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.teacher.name,
                              style: AppTextStyle.font16Medium,
                            ),
                            const SizedBox(width: 8),
                            Image.asset(Assets.assetsImagesPngVerified),
                          ],
                        ),
                        Text(
                          widget.teacher.title,
                          style: AppTextStyle.font16Regular,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              Assets.assetsImagesPngSAR,
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "${widget.teacher.pricePerHalfHour.toInt()} /30 دقيقة",
                              style: AppTextStyle.font16Medium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: IconButton(
                      icon: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: Icon(
                          key: ValueKey(isFavorite),
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: MyColors.purpleNormal,
                          size: 30,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _buildRichText(" يعلم: ", widget.teacher.subjects),
            const SizedBox(height: 8),
            _buildRichText(" يتحدث: ", widget.teacher.languages),
            const Divider(
              height: 30,
              thickness: 2,
              color: MyColors.greyLightHover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatsRow(
                  "${widget.teacher.rating} (${widget.teacher.totalReviews} تقييم)",
                  Icons.star,
                ),
                _buildStatsRow(
                  "${widget.teacher.totalStudents} طالب",
                  Icons.school,
                ),
                _buildStatsRow(
                  "${widget.teacher.totalHoursTaught} ساعة",
                  Icons.timer,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  RichText _buildRichText(String text, List<String> children) {
    return RichText(
      text: TextSpan(
        text: "$text ",
        style: AppTextStyle.font16SemiBold.copyWith(
          color: Colors.black,
          fontFamily: "sf-arabic-rounded",
        ),
        children: children.asMap().entries.map((lang) {
          return TextSpan(
            text: "${lang.value}${lang.value == children.last ? "." : ", "}",
            style: AppTextStyle.font16Regular.copyWith(
              color: MyColors.darkBlueDarker,
              fontFamily: "sf-arabic-rounded",
            ),
          );
        }).toList(),
      ),
    );
  }

  Row _buildStatsRow(String text, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: MyColors.purpleNormal),
        const SizedBox(width: 8),
        Text(text, style: AppTextStyle.font16Medium),
      ],
    );
  }
}
