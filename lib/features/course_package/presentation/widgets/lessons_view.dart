import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/primary_button.dart';

class LessonsCard extends StatefulWidget {
  const LessonsCard({
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
  State<LessonsCard> createState() => _LessonsCardState();
}

class _LessonsCardState extends State<LessonsCard> {
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
                        'الفصل الأول :',
                        style: AppTextStyle.font16Regular.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'المفاهيم الأساسية',
                        style: AppTextStyle.font16Regular.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                      horizontalPadding: 0,
                      child: ListView.separated(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => const Divider(
                          color: MyColors.purpleNormal,
                          height: 30,
                        ),
                        itemBuilder: (context, index) => const LessonsItem(
                          date: '6/10/2025',
                          title: 'الدرس الاول :  المفاهيم الأساسية',
                          description:
                              'في هذا الشابتر التمهيدي، ستتعرّف على المفاهيم الأساسية لتصميم تجربة المستخدم (UX) وواجهة المستخدم (UI)، وستبدأ أولى خطواتك العملية باستخدام أداة Figma.',
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAnimatedContainer extends StatelessWidget {
  const CustomAnimatedContainer({
    super.key,
    this.isExpanded = false,
    required this.child,
    this.horizontalPadding,
  });
  final bool isExpanded;
  final Widget child;
  final double? horizontalPadding;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding ?? 12,
        vertical: 12,
      ),
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
                  color: MyColors.purpleNormal.withValues(alpha: 0.1),
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

//leson item
class LessonsItem extends StatelessWidget {
  const LessonsItem({
    super.key,
    required this.title,
    required this.description,
    required this.date,
  });
  final String title, description, date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyle.font16Regular.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              PrimaryButton(
                radius: 16,
                text: 'انضم للحصة',
                onPressed: () {},
                backgroundColor: MyColors.orangeActiveBut,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: AppTextStyle.font14Regular.copyWith(
              color: Colors.grey.shade700,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            date,
            style: AppTextStyle.font14Regular.copyWith(
              color: Colors.grey.shade600,
              fontSize: 13,
            ),
          ),
          12.verticalSpace,
          Row(
            children: [
              Expanded(
                child: CustomButtonWithIcon(
                  startIcon: Image.asset(Assets.assetsImagesPngDownloadIcon),
                  title: 'تحميل اوراق العمل',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CustomButtonWithIcon(
                  startIcon: Image.asset(Assets.assetsImagesPngViewPDFIcon),
                  title: 'إختبار الدرس',
                  endIcon: const Icon(
                    Icons.circle,
                    color: MyColors.purpleNormal,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({
    super.key,
    this.onPressed,
    this.startIcon,
    required this.title,
    this.endIcon,
    this.startIconAlignment,
  });
  final void Function()? onPressed;
  final Widget? startIcon, endIcon;
  final IconAlignment? startIconAlignment;
  final String title;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: MyColors.purpleNormal),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      icon: startIcon,
      iconAlignment: startIconAlignment,
      label: Row(
        mainAxisSize: .min,
        children: [
          Text(
            title,
            style: AppTextStyle.font14Regular.copyWith(
              color: MyColors.purpleNormal,
            ),
          ),
          if (endIcon != null) const SizedBox(width: 6),
          if (endIcon != null) endIcon!,
        ],
      ),
    );
  }
}
