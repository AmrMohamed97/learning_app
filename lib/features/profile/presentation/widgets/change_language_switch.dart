import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class ChangeLanguageSwitch extends StatefulWidget {
  const ChangeLanguageSwitch({super.key});

  @override
  State<ChangeLanguageSwitch> createState() => _ChangeLanguageSwitchState();
}

class _ChangeLanguageSwitchState extends State<ChangeLanguageSwitch> {
  bool isArabic = true;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      minimumSize: const Size(0, 0),
      onPressed: () => setState(() => isArabic = false),
      child: AnimatedContainer(
        height: 40,
        width: 86,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: isArabic
              ? MyColors.darkBlueOflight
              : MyColors.purpleNormalHover,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        duration: const Duration(microseconds: 2000),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CupertinoButton(
              padding: const EdgeInsets.all(0),
              minimumSize: const Size(0, 0),
              onPressed: () => setState(() => isArabic = true),
              child: AnimatedContainer(
                height: 38,
                width: 41,
                decoration: BoxDecoration(
                  color: isArabic
                      ? MyColors.purpleNormalHover
                      : MyColors.darkBlueOflight,
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                ),
                duration: const Duration(microseconds: 2000),
                child: Center(
                  child: Text(
                    'ع',
                    style: AppTextStyle.font14SemiBold.copyWith(
                      color: isArabic ? Colors.white : Colors.black,
                      fontFamily: "sf-arabic-rounded",
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'EN',
                  style: AppTextStyle.font14SemiBold.copyWith(
                    color: isArabic ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
