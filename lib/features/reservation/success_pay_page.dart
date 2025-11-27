import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/primary_button.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';

class SuccessPayPage extends StatelessWidget {
  const SuccessPayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            // Success Illustration
            Container(
              width: 200.w,
              height: 200.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange.withOpacity(0.1), // Placeholder background
              ),
              child: Icon(
                Icons.check_circle,
                size: 100.sp,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 40.h),
            Text(
              'تم حجز درسك بنجاح',
              style: AppTextStyle.font20SemiBold.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            Text(
              'نتمنى لك تجربة تعليمية ممتعة ومفيدة',
              style: AppTextStyle.font14Regular.copyWith(
                color: MyColors.greyLightActive,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            PrimaryButton(
              isMax: true,
              onPressed: () {
                // Navigate to home or relevant page
                context.go(
                  PagesKeys.mainBottomNavView,
                ); // Or context.go(PagesKeys.homePage);
              },
              text: 'العودة للصفحة الرئيسية',
              height: 50.h,
              radius: 12.r,
              backgroundColor: MyColors.purpleNormal,
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: MyColors.purpleNormal),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  'المشاركة مع الأصدقاء',
                  style: AppTextStyle.font14Medium.copyWith(
                    color: MyColors.purpleNormal,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
