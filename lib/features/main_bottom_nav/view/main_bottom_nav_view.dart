import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/helper/countries_codes.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/features/main_bottom_nav/manager/main_bottom_nav_cubit.dart';
import 'package:talamiz_arina/features/main_bottom_nav/manager/main_bottom_nav_state.dart';

class MainBottomNavView extends StatelessWidget {
  const MainBottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBottomNavCubit, MainBottomNavState>(
      builder: (context, state) {
        final cubit = context.read<MainBottomNavCubit>();
        return Scaffold(
          appBar: cubit.currentIndex == 4 || cubit.currentIndex == 1
              ? null
              : const MainViewAppBar(),
          body: cubit.pages[cubit.currentIndex],
          //  IndexedStack(
          //   index: currentIndex,
          //   children: pages,
          // ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changePage(index);
            },
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: "الرئيسية",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.auto_stories),
                label: "الدورات",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: "الرسائئل",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined),
                label: "الجدول",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: "المعلمين",
              ),
            ],
          ),
        );
      },
    );
  }
}

class MainViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBottomNavCubit, MainBottomNavState>(
      builder: (context, state) {
        final cubit = context.read<MainBottomNavCubit>();
        return AppBar(
          centerTitle: false,
          title: SvgPicture.asset(
            height: 35,
            Assets.assetsImagesSvgLogoHeading,
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
