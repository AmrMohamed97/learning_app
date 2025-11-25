import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/my_button.dart';

class EmptyTransactionsWidget extends StatelessWidget {
  const EmptyTransactionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = _calculateTextWidth(
      text: "لمحفظتك مستعدة لرحلة الإنجاز!",
      style: AppTextStyle.font20SemiBold,
    );
    return Column(
      children: [
        const SizedBox(height: 30),
        SvgPicture.asset(Assets.assetsImagesSvgEmptyTrnasactions),
        const SizedBox(height: 16),
          Text(
          "لمحفظتك مستعدة لرحلة الإنجاز!",
          style: AppTextStyle.font20SemiBold,
        ),
        SizedBox(
          width: width,
          child:   Text(
            "هنا بتشوف كل ريال استثمرته في نفسك. نوقر تجربة تعليم ذكية وسريعة تمكّن أي شخص يحقق أهدافه. ابدأ الشحن الآن عشان ما توقفك أي تحديات مالية!",
            textAlign: TextAlign.center,
            style: AppTextStyle.font16Medium,
          ),
        ),
        const SizedBox(height: 48),
        MyButton(
          onPressed: () {
            context.push(PagesKeys.walletChargePage);
          },
          text: "اشحن الآن",
        ),
      ],
    );
  }

  double _calculateTextWidth({required String text, required TextStyle style}) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    return painter.width;
  }
}
