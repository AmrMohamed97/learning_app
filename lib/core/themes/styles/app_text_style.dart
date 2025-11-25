import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talamiz_arina/core/helper/font_weight_helper.dart';

abstract class AppTextStyle {
  static TextStyle heading = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font16Regular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle font16SemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font16Bold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle font16Medium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font20Medium = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font20SemiBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle font14Regular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font14Medium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle font14SemiBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
}
