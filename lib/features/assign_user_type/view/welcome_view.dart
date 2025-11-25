import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class WelcomView extends StatelessWidget {
  const WelcomView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const SizedBox(height: 50),
          FractionallySizedBox(
            widthFactor: .7,
            child: SvgPicture.asset(Assets.assetsImagesSvgLogoHeading),
          ),
          const SizedBox(height: 40),
          Text(
            'أهلاً بالنجم القادم! اختر دورك ',
            style: AppTextStyle.font16SemiBold.copyWith(
              fontSize: 28,
              color: MyColors.purpleNormalHover,
            ),
          ),
          Text(
            'وابدأ مغامرتك التعليمية !',
            style: AppTextStyle.font16SemiBold.copyWith(
              fontSize: 28,
              color: MyColors.purpleNormalHover,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'اختر نوع حسابك',
            style: AppTextStyle.font16SemiBold.copyWith(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
