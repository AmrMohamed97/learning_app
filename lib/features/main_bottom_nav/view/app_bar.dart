
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/helper/countries_codes.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/features/main_bottom_nav/manager/main_bottom_nav_cubit.dart';
import 'package:talamiz_arina/features/main_bottom_nav/manager/main_bottom_nav_state.dart';

class MainViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBottomNavCubit, MainBottomNavState>(
      builder: (context, state) {
        final cubit = context.read<MainBottomNavCubit>();
        return AppBar(
          centerTitle: false,
          title: Image.asset(
            height: 35,
            Assets.assetsImagesPngTalamizSplash,
          ),
          actions: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: MyColors.purpleLightActive,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(Assets.assetsImagesSvgNotifications),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: MyColors.purpleLightActive,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SvgPicture.asset(Assets.assetsImagesSvgPerson),
            ),
            // filter view
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
                bottom: 12,
              ),
              child: Text(
                textAlign: TextAlign.start,
                "${countryCodeToEmoji("EG")} الثالث ثانوي - علمي علوم",
                style: AppTextStyle.font16Medium,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 45);
}
