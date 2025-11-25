import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/features/course_package/presentation/widgets/course_package_data_item.dart';
import 'package:talamiz_arina/features/teacher_profile/presentation/widgets/price_view_item.dart';

class CoursePackageInfoView extends StatelessWidget {
  const CoursePackageInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CoursePackageDataItem(
                    title: 'علم فزياء',
                    description: 'الفيزياء العامة | فيز 1103 النظري والعملي',
                    image: Assets.assetsImagesPngProfileVideo,
                  ),
                ),
                PriceViewItem(price: '50'),
              ],
            ),
            SizedBox(height: 16),
            Divider(thickness: 1, color: Color(0xffF0F0F0), height: 0),
          ],
        ),
      ),
    );
  }
}
