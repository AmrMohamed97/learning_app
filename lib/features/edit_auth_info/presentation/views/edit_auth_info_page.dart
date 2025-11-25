import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/my_button.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';
import 'package:talamiz_arina/features/edit_auth_info/presentation/manager/edit_auth_info_cubit.dart';
import 'package:talamiz_arina/features/edit_auth_info/presentation/widgets/update_email_phone_fields.dart';
import 'package:talamiz_arina/features/edit_auth_info/presentation/widgets/update_password_fields.dart';

class EditAuthInfoPage extends StatefulWidget {
  const EditAuthInfoPage({super.key});

  @override
  State<EditAuthInfoPage> createState() => _EditAuthInfoPageState();
}

class _EditAuthInfoPageState extends State<EditAuthInfoPage> {
  late final EditAuthInfoCubit _authInfoCubit = context.read();

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      bottomNavigationBar: SafeArea(
        child: FractionallySizedBox(
          widthFactor: (700 / MediaQuery.of(context).size.width).clamp(0, 1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: ValueListenableBuilder(
              valueListenable: _authInfoCubit.isButtonEnabled,
              builder: (context, value, child) {
                return MyButton(
                  text: "حفظ التغييرات",
                  onPressed: value
                      ? () {
                          if (_authInfoCubit.formKey.currentState?.validate() == true) {}
                        }
                      : null,
                );
              },
            ),
          ),
        ),
      ),
      appBar: AppBar(title: const Text("المحفظة")),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _authInfoCubit.formKey,
            child: Column(
              children: [
                const SizedBox(height: 28),
                CustomSlidingSegmentedControl<int>(
                  height: 52,
                  innerPadding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 5,
                  ),
                  isStretch: true,
                  initialValue: 0,
                  children: {
                    0: Text(
                      'كلمة المرور',
                      style: AppTextStyle.font16Bold.copyWith(
                        color: _authInfoCubit.currentIndex == 0
                            ? MyColors.purpleNormal
                            : Colors.black,
                      ),
                    ),
                    1: Text(
                      'الإيميل ورقم الجوال',
                      style: AppTextStyle.font16Bold.copyWith(
                        color: _authInfoCubit.currentIndex == 1
                            ? MyColors.purpleNormal
                            : Colors.black,
                      ),
                    ),
                  },
                  decoration: BoxDecoration(
                    color: const Color(0xffE6E6E6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  thumbDecoration: BoxDecoration(
                    color: const Color(0xffE6E6E6),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: MyColors.purpleNormal, width: 2),
                  ),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInToLinear,
                  onValueChanged: (v) {
                    setState(() {
                      _authInfoCubit.currentIndex = v;
                      _authInfoCubit.validate();
                    });
                  },
                ),
                const SizedBox(height: 16),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: _authInfoCubit.currentIndex == 0
                      ? Column(
                          children: [
                            const UpdatePasswordFields(),
                            const SizedBox(height: 16),
                            RichText(
                              text: TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                                text: "نسيت كلمة المرور",
                                style: AppTextStyle.font16Bold.copyWith(
                                  color: MyColors.purpleNormal,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        )
                      : const UpdateEmailPhoneFields(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
