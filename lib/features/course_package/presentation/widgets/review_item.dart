
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({
    super.key, required this.name, required this.description, required this.rate, required this.review,
  });
  final String name, description, rate, review;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
            UserData(
            image: Assets.assetsImagesPngProfileAvatar,
            description: description,
            rate: rate,
            title: name,
          ),
          16.verticalSpace,
          Text(
            review,
            style: AppTextStyle.font16Regular,
          ),
        ],
      ),
    );
  }
}

class UserData extends StatelessWidget {
  const UserData({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.rate,
  });
  final String image, title, description, rate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 30, backgroundImage: AssetImage(image)),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(title, style: AppTextStyle.font16Bold),
                  const SizedBox(width: 8),
                  Image.asset(
                    Assets.assetsImagesPngVerified,
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
              Text(
                description,
                style: AppTextStyle.font14Medium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                '$rate ⭐',
                style: AppTextStyle.font14Medium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
