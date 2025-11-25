import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  bool isLottie = false;
  bool isbook = true;
  final Color primaryPurple = const Color(0xFF8366FF);
  final Color lightPurple = const Color(0xFFB39DFF);
  final Color darkPurple = const Color(0xFF6247EA);

  late AnimationController _orbController1;
  late AnimationController _orbController2;
  late AnimationController _orbController3;
  late AnimationController _orbController4;
  late AnimationController _backgroundController;

  void startLottie() {
    setState(() {
      isLottie = true;
      isbook = false;
    });
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 3415), () {
      startLottie();
    });
    super.initState();
    _orbController1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);

    _orbController2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    )..repeat(reverse: true);

    _orbController3 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);

    _orbController4 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);

    _backgroundController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _orbController1.dispose();
    _orbController2.dispose();
    _orbController3.dispose();
    _orbController4.dispose();
    _backgroundController.dispose();
    super.dispose();
  }

  void navToNexScreen() {
    context.push(PagesKeys.onboardingScreen);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      body: Stack(
        children: [
          // 1. Premium Gradient Background with Animation
          if (isLottie)
            Lottie.asset(
              'assets/images/lottie/splashBackground.json',
              width: double.infinity,
              height: double.infinity,
            ),

          // 2. Elegant Floating Particles (Premium Effect)
          // Top-Right Large Orb
          Positioned(
            top: -120,
            right: -120,
            child: AnimatedBuilder(
              animation: _orbController1,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, 30 * _orbController1.value),
                  child: Transform.scale(
                    scale: 1.0 + (0.3 * _orbController1.value),
                    child: Transform.rotate(
                      angle: 0.05 * _orbController1.value,
                      child: Container(
                        width: 450,
                        height: 450,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              primaryPurple.withOpacity(0.04),
                              lightPurple.withOpacity(0.02),
                              Colors.transparent,
                            ],
                            stops: const [0.0, 0.5, 1.0],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Bottom-Left Large Orb
          Positioned(
            bottom: -100,
            left: -100,
            child: AnimatedBuilder(
              animation: _orbController2,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, -40 * _orbController2.value),
                  child: Transform.scale(
                    scale: 1.0 + (0.4 * _orbController2.value),
                    child: Transform.rotate(
                      angle: -0.05 * _orbController2.value,
                      child: Container(
                        width: 380,
                        height: 380,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              darkPurple.withOpacity(0.04),
                              primaryPurple.withOpacity(0.02),
                              Colors.transparent,
                            ],
                            stops: const [0.0, 0.5, 1.0],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Center-Right Accent Orb
          Positioned(
            top: 180,
            right: -70,
            child: AnimatedBuilder(
              animation: _orbController3,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(-25 * _orbController3.value, 0),
                  child: Transform.scale(
                    scale: 1.0 + (0.2 * _orbController3.value),
                    child: Container(
                      width: 240,
                      height: 240,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            lightPurple.withOpacity(0.08),
                            primaryPurple.withOpacity(0.04),
                            Colors.transparent,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: primaryPurple.withOpacity(0.03),
                            blurRadius: 60,
                            spreadRadius: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Top-Left Small Accent
          Positioned(
            top: 100,
            left: -40,
            child: AnimatedBuilder(
              animation: _orbController4,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, 20 * _orbController4.value),
                  child: Transform.scale(
                    scale: 1.0 + (0.5 * _orbController4.value),
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            primaryPurple.withOpacity(0.06),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // 3. Glassmorphism Particles
          ...List.generate(8, (index) {
            final positions = [
              const Offset(0.1, 0.15),
              const Offset(0.8, 0.25),
              const Offset(0.2, 0.45),
              const Offset(0.85, 0.55),
              const Offset(0.15, 0.7),
              const Offset(0.75, 0.75),
              const Offset(0.3, 0.85),
              const Offset(0.9, 0.9),
            ];
            final sizes = [8.0, 12.0, 6.0, 10.0, 9.0, 7.0, 11.0, 8.0];
            final delays = [0, 200, 400, 600, 800, 1000, 1200, 1400];

            return Positioned(
              left: MediaQuery.of(context).size.width * positions[index].dx,
              top: MediaQuery.of(context).size.height * positions[index].dy,
              child:
                  Container(
                        width: sizes[index],
                        height: sizes[index],
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryPurple.withOpacity(0.15),
                          boxShadow: [
                            BoxShadow(
                              color: primaryPurple.withOpacity(0.1),
                              blurRadius: 15,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                      )
                      .animate()
                      .fade(delay: delays[index].ms, duration: 800.ms)
                      .scale(
                        begin: const Offset(0, 0),
                        end: const Offset(1, 1),
                        delay: delays[index].ms,
                        duration: 600.ms,
                      )
                      .then(delay: 200.ms)
                      .shimmer(
                        duration: 3.seconds,
                        color: Colors.white.withOpacity(0.6),
                      ),
            );
          }),

          // 4. Main Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),

                // Logo Container with Premium Glassmorphism
                Container(
                      padding: const EdgeInsets.all(35),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            Colors.white.withOpacity(0.9),
                            Colors.white.withOpacity(0.6),
                            Colors.white.withOpacity(0.3),
                          ],
                          stops: const [0.0, 0.7, 1.0],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: primaryPurple.withOpacity(0.08),
                            blurRadius: 50,
                            spreadRadius: 5,
                          ),
                          BoxShadow(
                            color: lightPurple.withOpacity(0.06),
                            blurRadius: 100,
                            spreadRadius: 20,
                          ),
                        ],
                      ),
                      child: Image.asset(
                        Assets.assetsImagesPngTalamizSplash,
                        width: 240,
                        fit: BoxFit.contain,
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 700.ms, curve: Curves.easeOut)
                    .scale(
                      begin: const Offset(0.5, 0.5),
                      end: const Offset(1.0, 1.0),
                      duration: 1000.ms,
                      curve: Curves.elasticOut,
                    )
                    .then()
                    .scale(
                      begin: const Offset(1.0, 1.0),
                      end: const Offset(1.08, 1.08),
                      duration: 1.5.seconds,
                      curve: Curves.easeInOut,
                    )
                    // .then(delay: 100.ms)
                    .shimmer(
                      duration: 2.6.seconds,
                      color: primaryPurple.withOpacity(0.15),
                      angle: 45,
                    )
                    .then(delay: 1.ms)
                    .callback(callback: (_) => navToNexScreen()),
                if (isbook)
                  Lottie.asset(
                    'assets/images/lottie/bookLottie.json',
                    width: 240,
                    height: 200,
                  ),
                if (!isbook) const SizedBox(width: 240, height: 200),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
