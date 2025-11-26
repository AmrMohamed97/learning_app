import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/features/login/presentation/manager/login_cubit.dart';
import 'package:talamiz_arina/features/login/presentation/manager/login_state.dart';
import 'package:talamiz_arina/features/login/presentation/widgets/login_fields.dart';

class FiledsTabBar extends StatelessWidget {
  const FiledsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();
        return DefaultTabController(
          length: 2,
          child:
              Column(
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
                          cubit.changeTab(index);
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
                                Text(
                                  "الهاتف المحمول",
                                  style: AppTextStyle.font16SemiBold,
                                ),
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
                      const LoginEmailFields(),
                    ],
                  )
                  .animate()
                  .fade(delay: 500.ms, duration: 600.ms)
                  .slideY(begin: 0.1, end: 0, delay: 500.ms, duration: 600.ms),
        );
      },
    );
  }
}
