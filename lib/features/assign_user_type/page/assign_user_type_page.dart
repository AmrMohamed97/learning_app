import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';
import 'package:talamiz_arina/features/assign_user_type/view/action_view.dart';
import 'package:talamiz_arina/features/assign_user_type/view/welcome_view.dart';

class AssignUserTypePage extends StatelessWidget {
  const AssignUserTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenWrapper(
      backGroundColor: Colors.white,
      topSafeArea: true,
      body: SafeArea(
        child: CustomScrollView(slivers: [WelcomView(), ActionView()]),
      ),
    );
  }
}
