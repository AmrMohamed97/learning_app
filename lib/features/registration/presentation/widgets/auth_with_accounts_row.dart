import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class AuthWithAccountsRow extends StatelessWidget {
  const AuthWithAccountsRow({super.key});

  final List<String> accounts = const [
    Assets.assetsImagesSvgGoogle,
    Assets.assetsImagesSvgFacebook,
    Assets.assetsImagesSvgApple,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Container(color: MyColors.greyDark, height: 1.5)),
            const SizedBox(width: 6),
              Text("او عن طريق", style: AppTextStyle.font14Regular),
            const SizedBox(width: 6),
            Expanded(child: Container(color: MyColors.greyDark, height: 1.5)),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: accounts
              .asMap()
              .entries
              .map(
                (e) => Expanded(
                  child: Container(
                    margin: EdgeInsetsDirectional.only(
                      start: e.key == 0 ? 0 : 8,
                      end: e.key == accounts.length - 1 ? 0 : 8,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: MyColors.darkBlueLight,
                      boxShadow: const [
                        BoxShadow(
                          color: MyColors.darkBlueNormal,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: MyColors.darkBlueNormalHover,
                        width: 1.5,
                      ),
                    ),
                    child: SvgPicture.asset(width: 24, height: 24, e.value),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
