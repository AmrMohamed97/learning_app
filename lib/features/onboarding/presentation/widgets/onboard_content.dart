import 'package:animate_do/animate_do.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/primary_button.dart';
import 'package:talamiz_arina/features/onboarding/presentation/controller/onbording_controller.dart';
import 'package:talamiz_arina/features/onboarding/presentation/controller/onbording_state.dart';

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnbordingCubit, OnbordingState>(
      builder: (context, state) {
        final controller = context.read<OnbordingCubit>();
        return ExpandablePageView.builder(
          controller: controller.pageController,
          onPageChanged: (value) {
            controller.changePage(value);
          },
          itemCount: onboardingIcons.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .5,
                  child: Center(child: Image.asset(onboardingIcons[index])),
                ),
                FadeIn(
                  delay: const Duration(milliseconds: 100),
                  duration: const Duration(milliseconds: 1000),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      onboardTitle[index],
                      style: AppTextStyle.font16SemiBold.copyWith(
                        fontSize: 28,
                        color: MyColors.purpleNormalHover,
                      ),
                    ),
                  ),
                ),
                if (controller.currentPage == 0)
                  Column(
                    children: [
                      const SizedBox(height: 12),
                      FadeIn(
                        delay: const Duration(milliseconds: 200),
                        duration: const Duration(milliseconds: 600),
                        child:   Text(
                          r'تحتاج شرح أكثر؟',
                          style: AppTextStyle.font16Medium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 12),
                FadeIn(
                  delay: const Duration(milliseconds: 450),
                  duration: const Duration(milliseconds: 700),
                  child: Text(
                    onboardText[index],
                    style: AppTextStyle.font16Regular,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 50),
                if (controller.currentPage == 2) ...[
                  FadeIn(
                    delay: const Duration(milliseconds: 700),
                    duration: const Duration(milliseconds: 700),
                    child: PrimaryButton(
                      isMax: true,
                      onPressed: () {
                        context.push(PagesKeys.assignUserTypePage);
                      },
                      text: "ادخل الساحة",
                      // backgroundColor: MyColors.secondaryOrangeDark,
                    ),
                  ),
                  const SizedBox(height: 16),
                  FadeIn(
                    delay: const Duration(milliseconds: 900),
                    duration: const Duration(milliseconds: 700),
                    child: PrimaryButton(
                      backgroundColor: Colors.white,
                      textColor: MyColors.purpleNormal,
                      borderColor: MyColors.purpleNormal,
                      isMax: true,
                      onPressed: () {
                        context.push(PagesKeys.registerPage);
                      },
                      text: "إنشاء حساب جديد",
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

const onboardingIcons = [
  'assets/images/png/onbording1.png',
  'assets/images/png/onbording2.png',
  'assets/images/png/onbording3.png',
];

const onboardTitle = [
  'دروس خصوصية على مزاجك',
  "جرّب كلاس واحد وشوف الفرق",
  "باكدج التحدي نبي نبني مستقبلك سوا",
];
const onboardText = [
  "اختر المدرّس اللي يناسبك وخذ جلسة خاصة تراجع فيها على راحتك، بوقتك وبالأسلوب اللي تحبّه",
  "مو لازم تبدأ بكورس كامل، خذ لك كلاس واحد جرّب فيه التفاعل، وبتشوف بنفسك الفرق",
  'خذ باكدج جلسات، تقدّم خطوة كل أسبوع، وخليك مستعد تقول قريب "سويتها أنا!" ',
];
