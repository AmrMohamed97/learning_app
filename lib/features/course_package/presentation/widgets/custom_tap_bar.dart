import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class CustomTapBar extends StatelessWidget {
  const CustomTapBar({super.key, required this.tabs});
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      collapsedHeight: 0,
      toolbarHeight: 0,
      elevation: 0,
      leadingWidth: 0,
      expandedHeight: 0,

      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: MyColors.greyLight.withValues(alpha: .49),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacer(),
                  Container(
                    width: 1,
                    height: 20,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  const Spacer(),
                  Container(
                    width: 1,
                    height: 20,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  const Spacer(),
                ],
              ),
              TabBar(
                dividerHeight: 0,
                padding: const EdgeInsets.all(0),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: MyColors.purpleNormal, width: 1.5),
                  color: Colors.transparent,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: MyColors.purpleNormal,
                unselectedLabelColor: Colors.black,
                labelStyle: AppTextStyle.font16SemiBold.copyWith(
                  fontFamily: "sf-arabic-rounded",
                ),
                unselectedLabelStyle: AppTextStyle.font14Regular.copyWith(
                  fontFamily: "sf-arabic-rounded",
                ),
                dividerColor: Colors.transparent,
                tabs: tabs,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
