import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/my_button.dart';

class AdWidget extends StatelessWidget {
  final String title;
  final String description;
  final String buttonTitle;
  final VoidCallback onPressed;
  const AdWidget({
    super.key,
    required this.title,
    required this.description,
    required this.buttonTitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage(Assets.assetsImagesPngAdBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: IntrinsicWidth(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: RichText(
                    text: TextSpan(
                      text: title,
                      style: AppTextStyle.font20Medium.copyWith(
                        fontFamily: "sf-arabic-rounded",
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: "\n$description",
                          style: AppTextStyle.font16Medium,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: Image.asset(Assets.assetsImagesPngAdIllustration),
                ),
              ],
            ),
            const SizedBox(height: 20),
            MyButton(text: buttonTitle, onPressed: onPressed),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
