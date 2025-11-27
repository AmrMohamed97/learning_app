import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';
import 'package:talamiz_arina/features/notification/presentation/widgets/custom_divider.dart';
import 'package:talamiz_arina/features/notification/presentation/widgets/notification_item.dart';
import 'package:talamiz_arina/features/notification/presentation/widgets/section_header.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'الإشعارات',
          style: AppTextStyle.font20SemiBold.copyWith(
            color: MyColors.greyNormal,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: MyColors.greyNormal),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        children: [
          const SectionHeader(title: 'اليوم'),
          SizedBox(height: 10.h),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: MyColors.purpleLight),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Column(
              children: [
                NotificationItem(
                  title: 'تحدي جديد وصلك',
                  description:
                      'تم إسناد اختبار لك من قبل معلمك ا.محمد العتيبي لمادة الرياضيات درس التفاضل والتكامل',
                  time: '12:00 PM',
                  count: 2,
                  icon: Icons.edit_document,
                  isLast: false,
                ),
                CustomDivider(),
                NotificationItem(
                  title: 'شحن المحفظة',
                  description:
                      'تم شحن محفظتك بمبلغ 200 ريال سعودي ، تقدر تحجز دروسك الآن كل الدعم يا بطل .',
                  time: '09:00 AM',
                  count: 2,
                  icon: Icons.account_balance_wallet_outlined,
                  isLast: false,
                ),
                CustomDivider(),
                NotificationItem(
                  title: 'تحدي جديد وصلك',
                  description:
                      'تم إسناد اختبار لك من قبل معلمك ا.محمد العتيبي لمادة الرياضيات درس التفاضل والتكامل',
                  time: '09:00 AM',
                  count: 2,
                  icon: Icons.edit_document,
                  isLast: true,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          const SectionHeader(title: 'أمس'),
          SizedBox(height: 10.h),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: MyColors.purpleLight),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Column(
              children: [
                NotificationItem(
                  title: 'حجز درس',
                  description:
                      'تم حجز درسك بنجاح ، مادة الرياضيات استاذ محمد ، مواعيدك السبت والثلاثاء',
                  time: '1/9/2025',
                  count: 0,
                  icon: Icons.menu_book_outlined,
                  isLast: false,
                ),
                CustomDivider(),
                NotificationItem(
                  title: 'شحن المحفظة',
                  description:
                      'تم شحن محفظتك بمبلغ 400 ريال سعودي ، تقدر تحجز دروسك الآن كل الدعم يا بطل .',
                  time: '2/2/2025',
                  count: 0,
                  icon: Icons.account_balance_wallet_outlined,
                  isLast: false,
                ),
                CustomDivider(),
                NotificationItem(
                  title: 'حجز درس',
                  description:
                      'تم حجز درسك بنجاح ، مادة الرياضيات استاذ محمد ، مواعيدك السبت والثلاثاء',
                  time: '1/1/2025',
                  count: 0,
                  icon: Icons.menu_book_outlined,
                  isLast: true,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
