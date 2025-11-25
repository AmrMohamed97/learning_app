import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class AboutTeacherItem extends StatefulWidget {
  const AboutTeacherItem({
    super.key,
    required this.lessonNumber,
    required this.title,
    required this.description,
    required this.date,
    required this.status, // 'locked', 'active', 'recorded'
    this.onAttendLesson,
    this.onDownloadNotes,
  });

  final String lessonNumber;
  final String title;
  final String description;
  final String date;
  final String status;
  final VoidCallback? onAttendLesson;
  final VoidCallback? onDownloadNotes;

  @override
  State<AboutTeacherItem> createState() => _AboutTeacherItemState();
}

class _AboutTeacherItemState extends State<AboutTeacherItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with lesson number and status
            CustomAnimatedContainer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'الدورات التدريبية',
                        style: AppTextStyle.font16Regular.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Text(
                      //   'المفاهيم الأساسية',
                      //   style: AppTextStyle.font16Regular.copyWith(
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                    ],
                  ),
                  AnimatedRotation(
                    turns: _isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),

            // content - only shown when expanded
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: _isExpanded
                  ? CustomAnimatedContainer(
                      child: Column(
                        children: List.generate(6, (index) {
                          return AboutTeacherContent(
                            title: widget.title,
                            subtitle: widget.description,
                          );
                        }),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutTeacherContent extends StatelessWidget {
  const AboutTeacherContent({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyle.font16SemiBold),
        // 12.verticalSpace,
        Text(subtitle, style: AppTextStyle.font16Regular),
      ],
    );
  }
}

class CustomAnimatedContainer extends StatelessWidget {
  const CustomAnimatedContainer({
    super.key,
    this.isExpanded = false,
    required this.child,
  });
  final bool isExpanded;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: MyColors.purpleNormal,
          // width: isExpanded ? 2 : 1,
        ),
        boxShadow: isExpanded
            ? [
                BoxShadow(
                  color: MyColors.purpleNormal.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: child,
    );
  }
}
