import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';

class DottedBorderPlaceholder extends StatelessWidget {
  const DottedBorderPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      childOnTop: false,
      options: CustomPathDottedBorderOptions(
        color: MyColors.darkBlueDarkActive,
        dashPattern: const [8, 8],
        strokeWidth: 2,
        customPath: (Size size) => Path()
          ..addOval(
            Rect.fromCircle(
              center: Offset(size.width / 2, size.width / 2),
              radius: size.width / 2,
            ),
          ),
      ),
      child: ClipOval(child: Image.asset(Assets.assetsImagesPngChecker)),
    );
  }
}
