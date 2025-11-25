import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';
import 'package:talamiz_arina/features/assign_user_type/view/action_view.dart';
import 'package:talamiz_arina/features/assign_user_type/view/welcome_view.dart';

class AssignUserTypePage extends StatelessWidget {
  const AssignUserTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return   ScreenWrapper(
      backGroundColor: Colors.white,
      topSafeArea: false, // Disable topSafeArea to let background cover status bar
      body: Stack(
        children: [
          // Subtle Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Color(0xFFFDFBF7), // Very faint orange/warm white
                  Color(0xFFF9F5FF), // Very faint purple/cool white
                ],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
          ),
          
          // Main Content
          const SafeArea(
            child: CustomScrollView(slivers: [WelcomView(), ActionView()]),
          ),
        ],
      ),
    );
  }
}
