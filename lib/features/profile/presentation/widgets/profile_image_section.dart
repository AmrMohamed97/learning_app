import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/helper/countries_codes.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/profile_image.dart';
import 'package:talamiz_arina/features/edit_profile/data/models/profile_data.dart';
import 'package:talamiz_arina/features/profile/presentation/widgets/profile_arch_shape.dart';

class ProfileImageSection extends StatelessWidget {
  const ProfileImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Stack(
        children: [
          ClipPath(
            clipper: ProfileArchShape(),
            child: Container(
              width: double.infinity,
              height: 170,
              decoration: const BoxDecoration(
                color: MyColors.purpleLightActive,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: .min,
              children: [
                Hero(
                  tag: "profile_img",
                  child: ProfileImage(
                    img: ValueNotifier(null),
                    editable: false,
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.push(
                          PagesKeys.editProfile,
                          extra: UserProfile(
                            fullName: "mohamed el-kholy",
                            curriculum:
                                "${countryCodeToEmoji("SA")} المنهج السعودي",
                            grade: "رياض الأطفال",
                            gender: "ذكر",
                          ),
                        );
                      },
                    text: "تعديل الملف الشخصي",
                    style: AppTextStyle.font16Medium.copyWith(
                      decoration: TextDecoration.underline,
                      color: MyColors.purpleNormalHover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
