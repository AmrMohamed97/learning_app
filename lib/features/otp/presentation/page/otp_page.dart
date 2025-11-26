import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/routes/page_routes.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/primary_button.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';
import 'package:talamiz_arina/features/otp/presentation/manager/otp_cubit.dart';
import 'package:talamiz_arina/features/otp/presentation/manager/otp_state.dart';
import 'package:talamiz_arina/features/otp/presentation/view/otp_fields.dart';
import 'package:talamiz_arina/features/otp/presentation/view/otp_page_description.dart';
import 'package:talamiz_arina/features/otp/presentation/widgets/otp_timer.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key, required this.phoneNumber, required this.nextPage});
  final String phoneNumber;
  final String nextPage;

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
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
          BlocBuilder<OtpCubit, OtpState>(
            builder: (context, state) {
              final cubit = context.read<OtpCubit>();
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            const SizedBox(height: 60),
                            FractionallySizedBox(
                                  widthFactor: .6,
                                  child: SvgPicture.asset(
                                    Assets.assetsImagesSvgLogoHeading,
                                  ),
                                )
                                .animate()
                                .fadeIn(duration: 600.ms)
                                .scale(delay: 200.ms),
                            const SizedBox(height: 40),
                            Text(
                                  'هلا والله بالبطل الجديد!',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.font16SemiBold.copyWith(
                                    fontSize: 28,
                                    color: MyColors.purpleNormalHover,
                                    height: 1.2,
                                  ),
                                )
                                .animate()
                                .fadeIn(delay: 300.ms)
                                .slideY(begin: 0.3, end: 0),
                            const SizedBox(height: 16),
                            OtpPageDescription(phoneNumber: phoneNumber)
                                .animate()
                                .fadeIn(delay: 400.ms)
                                .slideY(begin: 0.3, end: 0),
                            const SizedBox(height: 40),
                            OtpFields(
                                  onCompleted: (value) {
                                    cubit.complete();
                                  },
                                )
                                .animate()
                                .fadeIn(delay: 500.ms)
                                .slideY(begin: 0.3, end: 0),
                            const SizedBox(height: 24),
                            OtpTimer(
                              onFinished: () {},
                            ).animate().fadeIn(delay: 600.ms),
                            AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              height: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 24.0),
                            child:
                                PrimaryButton(
                                      isMax: true,

                                      text: 'تحقق',
                                      onPressed: cubit.isCompleted
                                          ? () {
                                              PageRoutes.goNamed(
                                                PagesKeys.mainBottomNavView,
                                              );
                                            }
                                          : null,
                                    )
                                    .animate()
                                    .fadeIn(delay: 700.ms)
                                    .slideY(begin: 0.5, end: 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
