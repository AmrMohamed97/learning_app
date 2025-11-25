import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/logo_heading.dart';
import 'package:talamiz_arina/core/widgets/my_button.dart';
import 'package:talamiz_arina/core/widgets/my_phone_number_form_field.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _isButtonEnabled = ValueNotifier(false);

  @override
  void initState() {
    _passwordController.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _isButtonEnabled.value = _formKey.currentState!.validate();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _formKey.currentState!.dispose();
    _isButtonEnabled.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: ValueListenableBuilder(
            valueListenable: _isButtonEnabled,
            builder: (context, value, child) {
              return MyButton(
                text: "ارسل رمز التحقق",
                onPressed: value
                    ? () {
                        context.push(
                          PagesKeys.otpPage,
                          extra: (_passwordController.text, PagesKeys.newPasswordPage),
                        );
                      }
                    : null,
              );
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                const SizedBox(height: 48),
                const Center(
                  child: LogoHeading(
                    text:
                        "هلا والله بعودتك يا بطل"
                        "!",
                  ),
                ),
                const SizedBox(height: 48),
                  Text(
                  "نسيت كلمة المرور ؟  لا تقلق راح نساعدك",
                  style: AppTextStyle.font20SemiBold,
                ),
                const SizedBox(height: 8),
                  Text(
                  "اكتب رقم جوالك عشان نرسل لك رمز التحقق وتقدر تعيد تعيين كلمة المرور بسهولة",
                  style: AppTextStyle.font16Regular,
                ),
                const SizedBox(height: 20),
                  Text("رقم الموبايل", style: AppTextStyle.font16Medium),
                const SizedBox(height: 12),
                MyPhoneNumberFormField(
                  controller: _passwordController,
                  hintText: "أدخل رقم الجوال",
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
