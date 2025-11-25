import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talamiz_arina/core/widgets/logo_heading.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';
import 'package:talamiz_arina/features/registration/presentation/manager/registration_cubit.dart';
import 'package:talamiz_arina/features/registration/presentation/widgets/Registration_fields.dart';
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
    EnterNameImgWidget(
      nameController: _cubit.nameController,
      image: _cubit.image,
    ),
    GenderRadioGroup(gender: _cubit.gender),
    CurriculumGradeWidget(
      crriculumController: _cubit.curriculumController,
      gradeController: _cubit.gradeController,
    ),
    RegistrationFields(
      emailController: _cubit.emailController,
      passwordController: _cubit.passwordController,
      phoneController: _cubit.phoneController,
    ),
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
          body: SafeArea(
            child: Form(
              key: _cubit.formKey,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          const SizedBox(height: 48),
                          const LogoHeading(
                            text:
                                "هلا والله بالبطل الجديد"
                                "!",
                          ),
                          const SizedBox(height: 40),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            child: _widgets[tabIndex],
                          ),
                          const SizedBox(height: 70),
                        ],
                      ),
                    ),
                    const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: RegistrationActions(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
