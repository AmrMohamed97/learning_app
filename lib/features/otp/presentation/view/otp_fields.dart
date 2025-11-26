import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class OtpFields extends StatelessWidget {
  const OtpFields({super.key, this.onCompleted});
  final void Function(String)? onCompleted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      child: Pinput(
        length: 6,
        validator: validateOTP,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        defaultPinTheme: defaultPinTheme(context),
        focusedPinTheme: focusedPinTheme(context),
        submittedPinTheme: submittedPinTheme(context),
        onCompleted: onCompleted,
      ),
    );
  }
}

PinTheme defaultPinTheme(BuildContext context) {
  final baseWidth = MediaQuery.sizeOf(context).width;

  return PinTheme(
    width: baseWidth / 6,
    height: 56,
    textStyle: AppTextStyle.font16Regular.copyWith(
      fontSize: 22,
      color: MyColors.darkBlueDarkHover,
      fontWeight: FontWeight.bold,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: MyColors.greyLightHover, width: 1.5),
      boxShadow: [
        BoxShadow(
          color: MyColors.greyNormal.withValues(alpha: 0.1),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
  );
}

PinTheme focusedPinTheme(BuildContext context) {
  const primaryColor = MyColors.purpleNormal;

  return defaultPinTheme(context).copyWith(
    decoration: defaultPinTheme(context).decoration!.copyWith(
      border: Border.all(color: primaryColor, width: 2),
      boxShadow: [
        BoxShadow(
          color: primaryColor.withValues(alpha: 0.25),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    ),
  );
}

PinTheme submittedPinTheme(BuildContext context) {
  const primaryColor = MyColors.purpleNormal;

  return defaultPinTheme(context).copyWith(
    decoration: defaultPinTheme(context).decoration!.copyWith(
      color: primaryColor.withValues(alpha: 0.08),
      border: Border.all(color: primaryColor),
    ),
  );
}

String? validateOTP(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter OTP code';
  } else {
    return null;
  }
}
