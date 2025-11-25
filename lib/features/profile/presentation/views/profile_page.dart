import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';
import 'package:talamiz_arina/features/profile/data/models/profile_item.dart';
import 'package:talamiz_arina/features/profile/presentation/widgets/change_language_switch.dart';
import 'package:talamiz_arina/features/profile/presentation/widgets/profile_image_section.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      appBar: AppBar(title: const Text("الملف الشخصي"), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ProfileImageSection(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    _builProfileSection("إعدادات الحساب", [
                      ProfileItem(
                        title: "المعلومات الشخصية",
                        img: Assets.assetsImagesSvgProfileIcon,
                        onTap: () {
                          context.push(PagesKeys.editAuthInfo);
                        },
                      ),
                      ProfileItem(
                        title: "اللغة",
                        img: Assets.assetsImagesSvgQuestion,
                        onTap: () {},
                        trailing: const ChangeLanguageSwitch(),
                      ),
                    ]),
                    _builProfileSection("الدعم", [
                      ProfileItem(
                        title: "تواصل معنا",
                        img: Assets.assetsImagesSvgSupport,
                        onTap: () {},
                      ),
                      ProfileItem(
                        title: "مركز المساعدة",
                        img: Assets.assetsImagesSvgQuestion,
                        onTap: () {},
                      ),
                    ]),
                    _builProfileSection("حول التطبيق", [
                      ProfileItem(
                        title: "عن التطبيق",
                        img: Assets.assetsImagesSvgAboutApp,
                        onTap: () {},
                      ),
                      ProfileItem(
                        title: "الشروط والأحكام",
                        img: Assets.assetsImagesSvgTerms,
                        onTap: () {},
                      ),
                      ProfileItem(
                        title: "سياسة الخصوصية",
                        img: Assets.assetsImagesSvgPrivcyPolicy,
                        onTap: () {},
                      ),
                      ProfileItem(
                        title: "الأسئلة الشائعة",
                        img: Assets.assetsImagesSvgQuestion,
                        onTap: () {},
                      ),
                    ]),
                    _builProfileSection("المزيد", [
                      ProfileItem(
                        title: "دعوة صديق",
                        img: Assets.assetsImagesSvgInviteFriend,
                        onTap: () {},
                      ),
                      ProfileItem(
                        title: "محفظتي",
                        img: Assets.assetsImagesSvgWallet,
                        onTap: () {
                          context.push(PagesKeys.walletPage);
                        },
                      ),
                    ]),
                    _builProfileSection("تسجيل الدخول", [
                      ProfileItem(
                        title: "تسجيل الخروج",
                        img: Assets.assetsImagesSvgLogout,
                        onTap: () {},
                      ),
                    ]),
                    const SizedBox(height: 24),
                    Text(
                      "رقم الإصدار : 1.2.3",
                      style: AppTextStyle.font14Regular,
                    ),
                    Text(
                      "Talamizarena.2025",
                      style: AppTextStyle.font14Regular,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile _buildProfileItem(
    String title,
    String img,
    Widget? trailing,
    Function() onTap,
  ) {
    return ListTile(
      title: Text(title),
      leading: SvgPicture.asset(width: 24, height: 24, img),
      trailing:
          trailing ?? const Icon(Icons.keyboard_arrow_left_outlined, size: 30),
      onTap: onTap,
    );
  }

  Widget _builProfileSection(String title, List<ProfileItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(title, style: AppTextStyle.font16SemiBold),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _buildProfileItem(
                items[index].title,
                items[index].img,
                items[index].trailing,
                items[index].onTap,
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                endIndent: 16,
                indent: 16,
                color: MyColors.darkBlueNormal,
              );
            },
            itemCount: items.length,
          ),
        ),
      ],
    );
  }
}
