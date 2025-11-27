import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';

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
          icon: const Icon(
            Icons.arrow_back,
            color: MyColors.greyNormal,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        children: [
          _buildSectionHeader('اليوم'),
          SizedBox(height: 10.h),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: MyColors.purpleLight),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildNotificationItem(
                  title: 'تحدي جديد وصلك',
                  description:
                      'تم إسناد اختبار لك من قبل معلمك ا.محمد العتيبي لمادة الرياضيات درس التفاضل والتكامل',
                  time: '12:00 PM',
                  count: 2,
                  icon: Icons.edit_document,
                  isLast: false,
                ),
                _buildDivider(),
                _buildNotificationItem(
                  title: 'شحن المحفظة',
                  description:
                      'تم شحن محفظتك بمبلغ 200 ريال سعودي ، تقدر تحجز دروسك الآن كل الدعم يا بطل .',
                  time: '09:00 AM',
                  count: 2,
                  icon: Icons.account_balance_wallet_outlined,
                  isLast: false,
                ),
                _buildDivider(),
                _buildNotificationItem(
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
          _buildSectionHeader('أمس'),
          SizedBox(height: 10.h),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: MyColors.purpleLight),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildNotificationItem(
                  title: 'حجز درس',
                  description:
                      'تم حجز درسك بنجاح ، مادة الرياضيات استاذ محمد ، مواعيدك السبت والثلاثاء',
                  time: '1/9/2025',
                  count: 0,
                  icon: Icons.menu_book_outlined,
                  isLast: false,
                ),
                _buildDivider(),
                _buildNotificationItem(
                  title: 'شحن المحفظة',
                  description:
                      'تم شحن محفظتك بمبلغ 400 ريال سعودي ، تقدر تحجز دروسك الآن كل الدعم يا بطل .',
                  time: '2/2/2025',
                  count: 0,
                  icon: Icons.account_balance_wallet_outlined,
                  isLast: false,
                ),
                _buildDivider(),
                _buildNotificationItem(
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

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Text(
        title,
        style: AppTextStyle.font16Bold.copyWith(
          color: MyColors.greyNormal,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: MyColors.purpleLight,
      indent: 16.w,
      endIndent: 16.w,
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String description,
    required String time,
    required int count,
    required IconData icon,
    required bool isLast,
  }) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Time and Count (Left side)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (count > 0) ...[
                Container(
                  padding: EdgeInsets.all(6.w),
                  decoration: const BoxDecoration(
                    color: MyColors.greenNormal,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    count.toString(),
                    style: AppTextStyle.font14Regular.copyWith(
                      color: Colors.white,
                      fontSize: 10.sp,
                      height: 1,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
              ],
              Text(
                time,
                style: AppTextStyle.font14Regular.copyWith(
                  color: MyColors.greyNormal,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          SizedBox(width: 12.w),
          // Content (Center)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: AppTextStyle.font16SemiBold.copyWith(
                    color: MyColors.greyNormal,
                  ),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 4.h),
                Text(
                  description,
                  style: AppTextStyle.font14Regular.copyWith(
                    color: MyColors.greyDarkActive, // Slightly lighter grey
                    height: 1.5,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          // Icon (Right side)
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: MyColors.purpleLight,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              icon,
              color: MyColors.purpleNormal,
              size: 24.w,
            ),
          ),
        ],
      ),
    );
  }
}