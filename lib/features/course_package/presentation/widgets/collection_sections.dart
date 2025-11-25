import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class CollectionSections extends StatelessWidget {
  const CollectionSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('تتضمن فصول هذه المجموعة :', style: AppTextStyle.font20SemiBold),
          16.verticalSpace,
          const SectionItem(
            icon: Assets.assetsImagesPngSubject,
            title: 'المادة',
            subtitle: 'جبر / هندسة',
          ),
          const Divider(height: 30),
          const SectionItem(
            icon: Assets.assetsImagesPngCalender,
            title: 'الجدول',
            subtitle: 'السبت و الثلاثاء',
          ),
          const Divider(height: 30),
          const SectionItem(
            icon: Assets.assetsImagesPngDateIcon,
            title: 'تاريخ البداية',
            subtitle: 'سبتمبر 6, 2025',
          ),
          const Divider(height: 30),
          const SectionItem(
            icon: Assets.assetsImagesPngDateIcon,
            title: 'تاريخ النهاية',
            subtitle: 'اكتوبر 6, 2025',
          ),
          const Divider(height: 30),
          const SectionItem(
            icon: Assets.assetsImagesPngTimeIcon,
            title: 'مدة الحصة',
            subtitle: '60 دقيقة',
          ),
          const Divider(height: 30),
          const SectionItem(
            icon: Assets.assetsImagesPngMemberIcon,
            title: 'اجمالي المقاعد',
            subtitle: '25 مقعد',
          ),
          const Divider(height: 30),
          const SectionItem(
            icon: Assets.assetsImagesPngElements,
            title: 'عدد الوحدات ',
            subtitle: '4 وحدات',
          ),
          const Divider(height: 30),
          const SectionItem(
            icon: Assets.assetsImagesPngElements,
            title: 'عدد الحصص',
            subtitle: '8 حصص',
          ),
        ],
      ),
    );
  }
}

class SectionItem extends StatelessWidget {
  const SectionItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });
  final String title, subtitle, icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(icon),
              8.horizontalSpace,
              Text(title, style: AppTextStyle.font16Medium),
            ],
          ),
          const SizedBox(width: 3),
          Text(
            subtitle,
            style: AppTextStyle.font16Medium.copyWith(
              color: MyColors.grayDarkActive,
            ),
          ),
        ],
      ),
    );
  }
}
