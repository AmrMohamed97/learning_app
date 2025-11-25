import 'package:flutter/material.dart';
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
          child: SvgPicture.asset(Assets.assetsImagesSvgLogoHeading),
        ),
        const SizedBox(height: 35),
        CustomTitle(
          text: text,
        ),
      ],
    );
  }
}
