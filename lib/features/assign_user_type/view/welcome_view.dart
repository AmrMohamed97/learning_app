import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
          )
              .animate()
              .fade(duration: 600.ms)
              .scale(delay: 100.ms, duration: 600.ms, curve: Curves.elasticOut),
          const SizedBox(height: 40),
          Text(
            'أهلاً بالنجم القادم! اختر دورك ',
            style: AppTextStyle.font16SemiBold.copyWith(
              fontSize: 28,
              color: MyColors.purpleNormalHover,
            ),
          )
              .animate()
              .fade(delay: 300.ms, duration: 600.ms)
              .slideY(begin: 0.2, end: 0, delay: 300.ms, duration: 600.ms),
          Text(
            'وابدأ مغامرتك التعليمية !',
            style: AppTextStyle.font16SemiBold.copyWith(
              fontSize: 28,
              color: MyColors.purpleNormalHover,
            ),
          )
              .animate()
              .fade(delay: 500.ms, duration: 600.ms)
              .slideY(begin: 0.2, end: 0, delay: 500.ms, duration: 600.ms),
          const SizedBox(height: 16),
          Text(
            'اختر نوع حسابك',
            style: AppTextStyle.font16SemiBold.copyWith(
              fontSize: 20,
              color: Colors.black,
            ),
          )
              .animate()
              .fade(delay: 700.ms, duration: 600.ms)
              .slideY(begin: 0.2, end: 0, delay: 700.ms, duration: 600.ms),
        ],
      ),
    );
  }
}
