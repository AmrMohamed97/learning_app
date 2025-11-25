import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navToNexScreen() {
    context.push(PagesKeys.onboardingScreen);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      body: Stack(
        children: [
          // Animated Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  MyColors.orangeLight,
                  MyColors.orangeLightHover,
                ],
              ),
            ),
          )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .saturate(duration: 4.seconds, begin: 0.9, end: 1.1)
              .shimmer(
                  duration: 5.seconds,
                  color: MyColors.orangeNormal.withOpacity(0.05),
                  angle: 45),

          // Decorative Background Shapes (Blobs)
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.orangeNormal.withOpacity(0.03),
              ),
            )
                .animate(
                    onPlay: (controller) => controller.repeat(reverse: true))
                .scale(
                    begin: const Offset(1, 1),
                    end: const Offset(1.2, 1.2),
                    duration: 4.seconds),
          ),
          Positioned(
            bottom: -50,
            left: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.orangeNormal.withOpacity(0.03),
              ),
            )
                .animate(
                    onPlay: (controller) => controller.repeat(reverse: true))
                .moveY(begin: 0, end: 30, duration: 5.seconds),
          ),

          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                // Logo
                Image.asset(
                  Assets.assetsImagesPngTalamizSplash,
                  width: 280,
                  fit: BoxFit.contain,
                )
                    .animate()
                    .fade(duration: 600.ms)
                    .scale(
                      begin: const Offset(0.8, 0.8),
                      end: const Offset(1.0, 1.0),
                      duration: 800.ms,
                      curve: Curves.easeOutBack,
                    )
                    .then()
                    .shimmer(duration: 1200.ms, color: Colors.white.withOpacity(0.4))
                    .then(delay: 2000.ms) // Wait before navigating
                    .callback(callback: (_) => navToNexScreen()),
                
                const Spacer(),
                
                // Linear Loading Indicator
                SizedBox(
                  width: 200,
                  child: Column(
                    children: [
                      LinearProgressIndicator(
                        backgroundColor: MyColors.orangeNormal.withOpacity(0.1),
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(MyColors.orangeNormal),
                        minHeight: 4,
                        borderRadius: BorderRadius.circular(2),
                      )
                          .animate()
                          .fade(delay: 500.ms, duration: 500.ms),
                      const SizedBox(height: 16),
                      // Text(
                      //   "جارِ التحميل...",
                      //   style: TextStyle(
                      //     color: MyColors.orangeNormal,
                      //     fontSize: 14,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ).animate().fade(delay: 600.ms, duration: 500.ms),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
