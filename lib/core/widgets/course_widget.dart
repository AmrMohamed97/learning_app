import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/features/home/presentation/widgets/course_info_widget.dart';
import 'package:talamiz_arina/features/home/presentation/widgets/courses_list.dart';

class CourseWidget extends StatefulWidget {
  final Course course;
  const CourseWidget({super.key, required this.course});

  @override
  State<CourseWidget> createState() => _CourseWidgetState();
}

class _CourseWidgetState extends State<CourseWidget> {
  late bool isFavorite = widget.course.isFavorite;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              image: DecorationImage(
                image: AssetImage(Assets.assetsImagesPngCourseImageDart),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Wrap(
                        children: List.generate(
                          widget.course.tags.length,
                          (index) => _buildCourseTagsContainer(
                            widget.course.tags[index],
                          ),
                        ),
                      ),
                    ),
                    if (widget.course.discount != null)
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            Assets.assetsImagesPngDiscountBannerDart,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              textAlign: TextAlign.center,
                              "${widget.course.discount!.toInt()}% \nخصم",
                              style: AppTextStyle.font16Medium.copyWith(
                                color: Colors.white,
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                const SizedBox(height: 100),
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.black54,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: IconButton(
                      key: ValueKey(isFavorite),
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          CourseInfoWidget(course: widget.course),
        ],
      ),
    );
  }

  Container _buildCourseTagsContainer(String tag) {
    return Container(
      margin: const EdgeInsetsDirectional.only(end: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Text(
        tag,
        style: AppTextStyle.font14Regular.copyWith(
          color: const Color(0xFF1858A5),
        ),
      ),
    );
  }
}
