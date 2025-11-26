import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/widgets/custom_title.dart';

class LogoHeading extends StatelessWidget {
  final String text;
  const LogoHeading({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FractionallySizedBox(
          widthFactor: .7,
          child: Image.asset(Assets.assetsImagesPngTalamizSplash),
        )
            .animate()
            .fade(duration: 600.ms)
            .scale(delay: 100.ms, duration: 600.ms, curve: Curves.elasticOut),
        const SizedBox(height: 35),
        CustomTitle(
          text: text,
        )
            .animate()
            .fade(delay: 300.ms, duration: 600.ms)
            .slideY(begin: 0.2, end: 0, delay: 300.ms, duration: 600.ms),
      ],
    );
  }
}
