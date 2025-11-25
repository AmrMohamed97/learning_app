import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class UserDataItem extends StatelessWidget {
  const UserDataItem({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });
  final String title, description, image;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 30, backgroundImage: AssetImage(image)),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(title, style: AppTextStyle.font16Medium),
                const SizedBox(width: 8),
                Image.asset(
                  Assets.assetsImagesPngVerified,
                  width: 20,
                  height: 20,
                ),
              ],
            ),
            Text(description, style: AppTextStyle.font14Medium),
          ],
        ),
      ],
    );
  }
}
