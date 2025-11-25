import 'package:dynamic_height_list_view/dynamic_height_view.dart';
import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class WalletInfoGrid extends StatelessWidget {
  const WalletInfoGrid({super.key});

  final List<(String title, int value, double discount, Color color)>
  walletInfo = const [
    ("الرصيد الإجمالي", 500, 1, Color(0xffFEF6D7)),
    ("مكافآت الشحن", 100, 11, Color(0xffED478A)),
    ("مكافآت الإحالة", 100, 12, Color(0xff8467FF)),
    ("رصيد المعلق", 100, -20, Color(0xffFB5002)),
  ];

  @override
  Widget build(BuildContext context) {
    return DynamicHeightGridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      itemCount: walletInfo.length,
      builder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [0.1, .2, .3, .4, .3, .2, .1]
                  .map((alpha) => walletInfo[index].$4.withValues(alpha: alpha))
                  .toList(),
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.info_outline, color: walletInfo[index].$4),
                  const SizedBox(width: 8),
                  Text(walletInfo[index].$1, style: AppTextStyle.font16Medium),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        walletInfo[index].$2.toString(),
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Image.asset(Assets.assetsImagesPngSAR),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    "${walletInfo[index].$3}%",
                    style: AppTextStyle.font16Medium.copyWith(
                      color: walletInfo[index].$3 > 0
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  if (walletInfo[index].$3 != 0)
                    Icon(
                      walletInfo[index].$3 > 0
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down,
                      color: walletInfo[index].$3 > 0
                          ? Colors.green
                          : Colors.red,
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
