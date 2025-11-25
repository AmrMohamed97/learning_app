import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/utills/validator.dart';
import 'package:talamiz_arina/core/widgets/my_button.dart';
import 'package:talamiz_arina/core/widgets/my_phone_number_form_field.dart';
import 'package:talamiz_arina/core/widgets/my_text_form_field.dart';
import 'package:talamiz_arina/features/payment/data/models/payment_result_data.dart';

class StcBottomSheetModal extends StatefulWidget {
  const StcBottomSheetModal({super.key});

  @override
  State<StcBottomSheetModal> createState() => _StcBottomSheetModalState();
}

class _StcBottomSheetModalState extends State<StcBottomSheetModal> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 16,
            top: 24,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width * .2,
                    height: 3,
                    decoration: BoxDecoration(
                      color: MyColors.darkBlueDarkActive,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "معلومات Stc Pay",
                    style: AppTextStyle.font20SemiBold,
                  ),
                ),
                const SizedBox(height: 24),
                Text("البريد الالكتروني", style: AppTextStyle.font16Medium),
                const SizedBox(height: 12),
                MyTextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "هذا الحقل مطلوب";
                    }
                    if (!Validator.validateEmail(value)) {
                      return "تأكد من كتابة البريد الإلكتروني بشكل صحيح.";
                    }
                    return null;
                  },
                  controller: _emailController,
                  hintText: "ادخل البريد الالكتروني",
                  suffixIcon: SvgPicture.asset(
                    Assets.assetsImagesSvgEmail,
                    fit: BoxFit.scaleDown,
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      MyColors.darkBlueDarkHover,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text("رقم الجوال", style: AppTextStyle.font16Medium),
                const SizedBox(height: 12),
                MyPhoneNumberFormField(
                  controller: _phoneController,
                  hintText: "رقم الجوال",
                ),
                const SizedBox(height: 24),
                MyButton(
                  text: "تأكيد",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.push(
                        PagesKeys.paymentResultPage,
                        extra: PaymentResultData(
                          isSuccess: false,
                          successTitle: "تم شحن محفظتك بنجاح",
                          successSubtitle:
                              "رصيدك الحالي 400 ريال أنت الآن جاهز لحجز أول فزعة",
                          failedTitle: "فشلت عملية الشحن",
                          failedSubtitle:
                              "تحقق من بيانات بطاقتك أو طريقة الدفع او توفر رصيد بالحساب ثم أعد المحاولة.",
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
