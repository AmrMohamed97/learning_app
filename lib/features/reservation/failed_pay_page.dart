import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/primary_button.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';

class FailedPayPage extends StatelessWidget {
  const FailedPayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            // Failed Illustration
            Container(
              width: 200.w,
              height: 200.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red.withOpacity(0.1), // Placeholder background
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.credit_card,
                    size: 100.sp,
                    color: MyColors.greyNormal,
                  ),
                  Positioned(
                    bottom: 40.h,
                    right: 40.w,
                    child: Container(
                      padding: EdgeInsets.all(4.w),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.cancel,
                        size: 30.sp,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            Text(
              'لم يتم إتمام الدفع',
              style: AppTextStyle.font20SemiBold.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12.h),
            Text(
              'تحقق من بيانات بطاقتك أو طريقة الدفع او توفر رصيد بالحساب ثم أعد المحاولة.',
              style: AppTextStyle.font14Regular.copyWith(
                color: MyColors.greyLightActive,
              ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            PrimaryButton(
              isMax: true,
              onPressed: () {
                 context.go(PagesKeys.mainBottomNavView);
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