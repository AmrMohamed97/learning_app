import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.title,
    required this.description,
    required this.time,
    required this.count,
    required this.icon,
    required this.isLast,
  });
  final String title;
  final String description;
  final String time;
  final int count;
  final IconData icon;
  final bool isLast;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon (Right side)
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: MyColors.purpleLight,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, color: MyColors.purpleNormal, size: 24.w),
          ),
          //---------------------
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
          // Time and Count (Left side)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: .end,
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
        ],
      ),
    );
  }
}
