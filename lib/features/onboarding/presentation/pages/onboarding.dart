import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/features/onboarding/presentation/widgets/change_language_widgets.dart';
import 'package:talamiz_arina/features/onboarding/presentation/widgets/custom_steper.dart';

import '../../../../core/widgets/screen_wrapper.dart';
import '../controller/onbording_controller.dart';
import '../controller/onbording_state.dart';
import '../widgets/onboard_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = OnbordingCubit();
        cubit.autoNextPage(); // ابدأ الانتقال التلقائي أول ما يفتح الأونبورد
        return cubit;
      },
      child: BlocBuilder<OnbordingCubit, OnbordingState>(
        builder: (context, state) {
          return ScreenWrapper(
            backGroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: CustomSteper(),
                    ),
                    const SizedBox(height: 6),
                    ChangeLangWidget(
                      skipPress: () {
                        context.push(PagesKeys.assignUserTypePage);
                      },
                    ),
                    //----end of steper
                    const OnBoardContent(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
