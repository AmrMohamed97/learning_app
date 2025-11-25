import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/features/login/presentation/manager/login_cubit.dart';
import 'package:talamiz_arina/features/login/presentation/widgets/login_fields.dart';

class FiledsTabBar extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;
  const FiledsTabBar({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.phoneController,
  });

  @override
  State<FiledsTabBar> createState() => _FiledsTabBarState();
}

class _FiledsTabBarState extends State<FiledsTabBar> {
  @override
  Widget build(BuildContext context) {
    final LoginCubit cubit = context.read();
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const SizedBox(height: 32),
          TabBar(
            indicatorColor: MyColors.purpleNormalHover,
            indicatorWeight: 1,
            dividerColor: Colors.transparent,
            labelStyle: AppTextStyle.font16SemiBold.copyWith(
              color: MyColors.purpleNormalHover,
              fontFamily: "sf-arabic-rounded",
            ),
            onTap: (index) {
              setState(() {
                cubit.currentTabIndex = index;
                context.read<LoginCubit>().validate();
              });
            },
            tabs: [
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      width: 24,
                      height: 24,
                      Assets.assetsImagesGifPhone,
                    ),
                    const SizedBox(width: 5),
                    Text("الهاتف المحمول", style: AppTextStyle.font16SemiBold),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      width: 24,
                      height: 24,
                      Assets.assetsImagesGifEmail,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "البريد الإلكتروني",
                      style: AppTextStyle.font16SemiBold,
                    ),
                  ],
                ),
              ),
            ],
          ),
          LoginEmailFields(
            emailController: widget.emailController,
            passwordController: widget.passwordController,
            phoneController: widget.phoneController,
            isUsingPhone: cubit.currentTabIndex == 0,
          ),
        ],
      ),
    );
  }
}
