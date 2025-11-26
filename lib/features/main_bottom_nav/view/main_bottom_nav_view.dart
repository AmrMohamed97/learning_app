import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/features/main_bottom_nav/manager/main_bottom_nav_cubit.dart';
import 'package:talamiz_arina/features/main_bottom_nav/manager/main_bottom_nav_state.dart';
import 'package:talamiz_arina/features/main_bottom_nav/view/app_bar.dart';


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
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changePage(index);
                },
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                elevation: 0,
                selectedItemColor: MyColors.purpleNormal,
                unselectedItemColor: MyColors.greyLightActive,
                selectedLabelStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                showUnselectedLabels: true,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home),
                    label: "الرئيسية",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.auto_stories_outlined),
                    activeIcon: Icon(Icons.auto_stories),
                    label: "الدورات",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.message_outlined),
                    activeIcon: Icon(Icons.message),
                    label: "الرسائل",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_month_outlined),
                    activeIcon: Icon(Icons.calendar_month),
                    label: "الجدول",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.school_outlined),
                    activeIcon: Icon(Icons.school),
                    label: "المعلمين",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
