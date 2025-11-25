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
          // 1. Base Gradient Background (Light & Fresh)
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
                stops: [0.0, 0.6, 1.0],
              ),
            ),
          )
              .animate(onPlay: (controller) => controller.repeat(reverse: true))
              .saturate(duration: 5.seconds, begin: 0.8, end: 1.2),

          // 2. Floating Particles / Blobs (The "Wow" Factor)
          // Top-right large blob
          Positioned(
            top: -100,
            right: -80,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    MyColors.orangeNormal.withOpacity(0.1),
                    Colors.transparent,
                  ],
                ),
              ),
            )
                .animate(
                    onPlay: (controller) => controller.repeat(reverse: true))
                .scale(
                    begin: const Offset(1, 1),
                    end: const Offset(1.1, 1.1),
                    duration: 4.seconds)
                .rotate(begin: 0, end: 0.05, duration: 5.seconds),
          ),
          // Bottom-left large blob
          Positioned(
            bottom: -50,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    MyColors.orangeLightActive.withOpacity(0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            )
                .animate(
                    onPlay: (controller) => controller.repeat(reverse: true))
                .moveY(begin: 0, end: 40, duration: 6.seconds)
                .scale(
                    begin: const Offset(1, 1),
                    end: const Offset(1.2, 1.2),
                    duration: 6.seconds),
          ),
          // Small floating particle 1
          Positioned(
            top: 150,
            left: 50,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.orangeNormal.withOpacity(0.2),
              ),
            )
                .animate(
                    onPlay: (controller) => controller.repeat(reverse: true))
                .moveY(begin: 0, end: -30, duration: 3.seconds)
                .fadeIn(duration: 1.seconds),
          ),
          // Small floating particle 2
          Positioned(
            bottom: 200,
            right: 40,
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.orangeDark.withOpacity(0.1),
              ),
            )
                .animate(
                    onPlay: (controller) => controller.repeat(reverse: true))
                .moveY(begin: 0, end: -50, duration: 4.seconds)
                .fadeIn(duration: 1.5.seconds),
          ),

          // 3. Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                // Logo with enhanced animation
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: MyColors.orangeNormal.withOpacity(0.2),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    Assets.assetsImagesPngTalamizSplash,
                    width: 280,
                    fit: BoxFit.contain,
                  ),
                )
                    .animate()
                    .fade(duration: 800.ms)
                    .scale(
                      begin: const Offset(0.5, 0.5),
                      end: const Offset(1.0, 1.0),
                      duration: 1000.ms,
                      curve: Curves.elasticOut,
                    )
                    .then()
                    .shimmer(
                        duration: 1500.ms,
                        color: Colors.white.withOpacity(0.5),
                        angle: 45)
                    .then(delay: 2000.ms)
                    .callback(callback: (_) => navToNexScreen()),

                const Spacer(),

                // Polished Linear Loading Indicator
                SizedBox(
                  width: 180,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          backgroundColor:
                              MyColors.orangeNormal.withOpacity(0.1),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              MyColors.orangeNormal),
                          minHeight: 6,
                        ),
                      )
                          .animate()
                          .fade(delay: 500.ms, duration: 500.ms)
                          .shimmer(
                              duration: 2.seconds,
                              color: Colors.white.withOpacity(0.5)),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
