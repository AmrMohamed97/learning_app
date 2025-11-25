import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/routes/page_routes.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/primary_button.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';
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
      topSafeArea: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 48),
                    FractionallySizedBox(
                      widthFactor: .7,
                      child: SvgPicture.asset(
                        Assets.assetsImagesSvgLogoHeading,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'هلا والله بالبطل الجديد!',
                      style: AppTextStyle.font16SemiBold.copyWith(
                        fontSize: 28,
                        color: MyColors.purpleNormalHover,
                      ),
                    ),
                    const SizedBox(height: 48),
                    OtpPageDescription(phoneNumber: phoneNumber),
                    const SizedBox(height: 20),
                    OtpFields(onCompleted: (value) {}),
                    const SizedBox(height: 12),
                    OtpTimer(onFinished: () {}),
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
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: PrimaryButton(
                      isMax: true,
                      text: 'تحقق',
                      onPressed: () {
                        PageRoutes.goNamed(PagesKeys.mainBottomNavView);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
