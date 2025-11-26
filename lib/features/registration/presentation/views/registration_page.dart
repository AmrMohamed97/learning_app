import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/widgets/logo_heading.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';
import 'package:talamiz_arina/features/registration/presentation/manager/registration_cubit.dart';
import 'package:talamiz_arina/features/registration/presentation/widgets/registration_fields.dart';
import 'package:talamiz_arina/features/registration/presentation/widgets/curriculum_grade_widget.dart';
import 'package:talamiz_arina/features/registration/presentation/widgets/enter_name_img_widget.dart';
import 'package:talamiz_arina/features/registration/presentation/widgets/gender_radio_group.dart'
    show GenderRadioGroup;
import 'package:talamiz_arina/features/registration/presentation/widgets/registration_actions.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late final RegistrationCubit _cubit = context.read();
  late final List<Widget> _widgets = [
    const EnterNameImgWidget(),
    const GenderRadioGroup(),
    const CurriculumGradeWidget(),
    const RegistrationFields(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _cubit.tabIndex,
      builder: (context, tabIndex, child) {
        return ScreenWrapper(
          canPop: tabIndex == 0,
          onPopInvoked: (didPop, result) {
            if (tabIndex > 0) {
              _cubit.tabIndex.value--;
            }
          },
          backGroundColor: Colors.white,
          topSafeArea: false,
          body: Stack(
            children: [
              // Background Decoration
              Positioned(
                top: -100,
                right: -100,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyColors.purpleNormal.withValues(alpha: 0.1),
                  ),
                ),
              ),
              Positioned(
                bottom: -50,
                left: -50,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyColors.purpleNormal.withValues(alpha: 0.05),
                  ),
                ),
              ),
              SafeArea(
                child: Form(
                  key: _cubit.formKey,
                  autovalidateMode: _cubit.autovalidateMode.value,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              const SizedBox(height: 60),
                              const LogoHeading(
                                text: "هلا والله بالبطل الجديد!",
                              ).animate().fadeIn(duration: 600.ms).scale(delay: 200.ms),
                              const SizedBox(height: 40),
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 500),
                                switchInCurve: Curves.easeOutBack,
                                switchOutCurve: Curves.easeInBack,
                                transitionBuilder: (child, animation) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: SlideTransition(
                                      position: Tween<Offset>(
                                        begin: const Offset(0.0, 0.1),
                                        end: Offset.zero,
                                      ).animate(animation),
                                      child: child,
                                    ),
                                  );
                                },
                                child: KeyedSubtree(
                                  key: ValueKey<int>(tabIndex),
                                  child: _widgets[tabIndex],
                                ),
                              ),
                              const SizedBox(height: 70),
                            ],
                          ),
                        ),
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: const RegistrationActions()
                                .animate()
                                .fadeIn(delay: 400.ms)
                                .slideY(begin: 0.5, end: 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
