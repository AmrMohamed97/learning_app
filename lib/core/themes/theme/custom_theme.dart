// import '../../../core/const/app_const.dart';
// import 'package:flutter/services.dart';
// import '../../../core/themes/colors/colors.dart';

import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    toolbarHeight: 60,
    scrolledUnderElevation: 0,
    centerTitle: true,
    actionsPadding: const EdgeInsets.symmetric(horizontal: 20),
    titleTextStyle: AppTextStyle.font20SemiBold.copyWith(
      color: Colors.black,
      fontFamily: 'sf-arabic-rounded',
    ),
  ),
  fontFamily: 'sf-arabic-rounded',
  scaffoldBackgroundColor: Colors.white,
  bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
);

//dark theme

// ThemeData darkTheme = ThemeData(
//   fontFamily: AppConstant.kFontFamily,
//   brightness: Brightness.dark,
//   scaffoldBackgroundColor: DarkColors.backgroundColor,
//   bottomAppBarTheme: const BottomAppBarTheme(),
//   iconTheme: const IconThemeData(color: DarkColors.textColor),
//   primaryColor: DarkColors.primaryColor,
//   useMaterial3: true,
//   colorScheme: const ColorScheme.dark().copyWith(
//     primaryContainer: DarkColors.containerColor,
//     secondary: DarkColors.blueColor,
//     shadow: DarkColors.black,
//     error: LightColors.redColor,
//     surface: LightColors.secondButtonColor,
//   ),
//   textTheme: const TextTheme(
//     bodyMedium: TextStyle(fontFamily: AppConstant.kFontFamily, color: DarkColors.textColor),
//     bodySmall: TextStyle(fontFamily: AppConstant.kFontFamily, color: DarkColors.text2Color),
//   ),
//   appBarTheme: AppBarTheme(
//     scrolledUnderElevation: 0,
//     centerTitle: false,
//     systemOverlayStyle: SystemUiOverlayStyle(
//       statusBarColor: DarkColors.backgroundColor,
//       statusBarIconBrightness: Brightness.light,
//       statusBarBrightness: Brightness.dark,
//     ),
//     backgroundColor: Colors.transparent,
//     elevation: 0,
//     titleTextStyle: TextStyle(
//       fontFamily: AppConstant.kFontFamily,
//       color: DarkColors.textColor,
//       fontSize: 20.sp,
//       // height: getTextHeight(20, 24.2),
//       fontWeight: FontWeight.w600,
//     ),
//     iconTheme: const IconThemeData(color: DarkColors.textColor),
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: DarkColors.primaryColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16.r),
//         side: const BorderSide(color: DarkColors.primaryColor),
//       ),
//       textStyle: TextStyle(
//         fontFamily: AppConstant.kFontFamily,
//         fontSize: 16.sp,
//         fontWeight: FontWeight.w700,
//         // height: getTextHeight(16, 19.36),
//         color: DarkColors.textColor,
//       ),
//       fixedSize: Size(double.maxFinite, 49.h),
//       foregroundColor: Colors.white,
//     ),
//   ),
// );

// ThemeData darkTheme = ThemeData(
//   fontFamily: AppConstant.kFontFamily,
//   brightness: Brightness.dark,
//   scaffoldBackgroundColor: DarkColors.backgroundColor,
//   primaryColor: DarkColors.forGroundColor,
//   useMaterial3: true,
//   colorScheme: const ColorScheme.dark().copyWith(
//     primaryContainer: DarkColors.black,
//     secondary: DarkColors.blueColor,
//     shadow: Colors.white,
//     error: DarkColors.redColor,
//     surface: DarkColors.secondButtonColor,
//     onPrimary: DarkColors.lightBlack,
//     onSecondary: DarkColors.appBarColor,
//     inversePrimary: DarkColors.backgroundColor,
//   ),
//   textTheme: const TextTheme(
//     bodyMedium: TextStyle(
//       fontFamily: AppConstant.kFontFamily,
//       color: DarkColors.textColor,
//     ),
//     bodySmall: TextStyle(
//       fontFamily: AppConstant.kFontFamily,
//       color: DarkColors.text2Color,
//     ),
//   ),
//   iconTheme: const IconThemeData(color: DarkColors.textColor),
//   appBarTheme: AppBarTheme(
//     scrolledUnderElevation: 0,
//     centerTitle: false,
//     backgroundColor: Colors.transparent,
//     systemOverlayStyle: SystemUiOverlayStyle(
//       statusBarColor: DarkColors.backgroundColor,
//       statusBarIconBrightness: Brightness.light,
//       statusBarBrightness: Brightness.dark,
//     ),
//     elevation: 0,
//     titleTextStyle: TextStyle(
//       color: DarkColors.textColor,
//       fontFamily: AppConstant.kFontFamily,
//       fontSize: 20,
//       fontWeight: FontWeight.w600,
//     ),
//     iconTheme: const IconThemeData(color: DarkColors.textColor),
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: DarkColors.secondButtonColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//         side: const BorderSide(color: DarkColors.secondButtonColor),
//       ),
//       textStyle: TextStyle(
//         fontFamily: AppConstant.kFontFamily,
//         fontSize: 16,
//         fontWeight: FontWeight.w700,
//         color: DarkColors.textColor,
//       ),
//       fixedSize: Size(double.maxFinite, 49),
//       foregroundColor: DarkColors.textColor,
//     ),
//   ),
//   // bottomNavigationBarTheme: BottomNavigationBarThemeData(
//   //   backgroundColor: LightColors.offWhite,
//   //   selectedItemColor: LightColors.orangeColor,
//   //   unselectedItemColor: LightColors.text2Color,
//   //   elevation: 4.0,
//   // ),
// );
