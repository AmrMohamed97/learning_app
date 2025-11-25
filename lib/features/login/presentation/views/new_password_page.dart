import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/utills/validator.dart';
import 'package:talamiz_arina/core/widgets/logo_heading.dart';
import 'package:talamiz_arina/core/widgets/my_button.dart';
import 'package:talamiz_arina/core/widgets/my_text_form_field.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _isButtonEnabled = ValueNotifier(false);

  @override
  void initState() {
    _passwordController.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _isButtonEnabled.value = _formKey.currentState!.validate();
      });
    });
    _newPasswordController.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _isButtonEnabled.value = _formKey.currentState!.validate();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _newPasswordController.dispose();
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
                text: "تأكيد",
                onPressed: value
                    ? () {
                        context.push(
                          PagesKeys.loginPage,
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  "كلمة المرور الجديدة",
                  style: AppTextStyle.font16Medium,
                ),
                const SizedBox(height: 12),
                MyTextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  hintText: "أدخل كلمة المرورالجديدة",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "الرجاء إدخال كلمة المرور";
                    }
                    if (!Validator.validatePassword(value)) {
                      return "يجب أن تحتوي كلمة المرور على 8 أحرف على الأقل، وتشمل حروفًا وأرقامًا";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                  Text(
                  "تأكيد كلمة المرور الجديدة",
                  style: AppTextStyle.font16Medium,
                ),
                const SizedBox(height: 12),
                MyTextFormField(
                  obscureText: true,
                  controller: _newPasswordController,
                  hintText: "أدخل كلمة المرور الجديدة مرة أخرى",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "الرجاء إدخال كلمة المرور الجديدة مرة أخرى";
                    }
                    if (value != _passwordController.text) {
                      return "كلمة المرور غير متطابقة";
                    }
                    return null;
                  },
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
