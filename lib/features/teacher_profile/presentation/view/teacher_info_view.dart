import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/features/teacher_profile/presentation/widgets/custom_container.dart';
import 'package:talamiz_arina/features/teacher_profile/presentation/widgets/price_view_item.dart';
import 'package:talamiz_arina/features/teacher_profile/presentation/widgets/user_data_item.dart';

class TeacherInfoView extends StatelessWidget {
  const TeacherInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UserDataItem(
                  title: 'ا.محمد العتيبي',
                  description: 'وحش الكمياء',
                  image: Assets.assetsImagesPngProfileVideo,
                ),
                PriceViewItem(price: '50'),
              ],
            ),
            SizedBox(height: 16),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                spacing: 10,
                children: [
                  CustomContainer(
                    title: '8 باقة دراسية ',
                    color: MyColors.greenLightActive,
                    textColor: MyColors.green,
                  ),
                  CustomContainer(
                    title: ' ⭐ 111 طالب',
                    color: Color(0xffFFF4CD),
                  ),
                  CustomContainer(
                    title: ' ⭐ 222 ساعة',
                    color: Color(0xffF0F9FF),
                    textColor: Color(0xff026AA2),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Divider(thickness: 1, color: Color(0xffF0F0F0), height: 0),
            // SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
