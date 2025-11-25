import 'package:flutter/cupertino.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class PriceViewItem extends StatelessWidget {
  const PriceViewItem({super.key, required this.price});
  final String price;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(Assets.assetsImagesPngSAR),
            const SizedBox(width: 3),
            Text(price, style: AppTextStyle.font20SemiBold),
          ],
        ),
         Text('سعر الساعه', style: AppTextStyle.font16Regular),
      ],
    );
  }
}
