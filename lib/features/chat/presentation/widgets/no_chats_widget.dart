import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/my_button.dart';

class NoChatsWidget extends StatelessWidget {
  const NoChatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FractionallySizedBox(
                      widthFactor: .6,
                      child: Image.asset(Assets.assetsImagesPngNoChatsImage),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "لا توجد محادثات بعد",
                      style: AppTextStyle.font20SemiBold,
                    ),
                    Text(
                      "بدأ اسأل معلّميك عن أي شيء أو تتكلم معهم عن أهدافك التعليمية",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.font16Medium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: MyButton(onPressed: () {}, text: "إبدأ محادثة"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
