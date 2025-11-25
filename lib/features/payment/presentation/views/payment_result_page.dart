import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/my_button.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';
import 'package:talamiz_arina/features/payment/data/models/payment_result_data.dart';

class PaymentResultPage extends StatelessWidget {
  final PaymentResultData paymentResultData;
  const PaymentResultPage({super.key, required this.paymentResultData});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 70),
                    SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        fit: BoxFit.fill,
                        paymentResultData.isSuccess
                            ? Assets.assetsImagesGifPaymentSuccess
                            : Assets.assetsImagesGifPaymentFailed,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      paymentResultData.isSuccess
                          ? paymentResultData.successTitle
                          : paymentResultData.failedTitle,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.font20SemiBold,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      paymentResultData.isSuccess
                          ? paymentResultData.successSubtitle
                          : paymentResultData.failedSubtitle,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.font16Regular,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MyButton(
                          text: paymentResultData.isSuccess
                              ? "العودة للصفحة الرئيسية"
                              : "المحاولة مرة اخرى",
                          onPressed: () {
                            if (paymentResultData.isSuccess) {
                            } else {}
                          },
                        ),
                        const SizedBox(height: 16),
                        MyButton(
                          text: paymentResultData.isSuccess
                              ? "المشاركة مع الأصدقاء"
                              : "المشاركة مع الأصدقاء",
                          borderColor: MyColors.purpleNormalActive,
                          color: Colors.transparent,
                          textColor: MyColors.purpleNormalActive,
                          onPressed: () {
                            if (paymentResultData.isSuccess) {
                            } else {}
                          },
                        ),
                      ],
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
