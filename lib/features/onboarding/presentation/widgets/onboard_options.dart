import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/features/onboarding/presentation/controller/onbording_controller.dart';
import 'package:talamiz_arina/features/onboarding/presentation/controller/onbording_state.dart';

class OnBoardBottomOptions extends StatelessWidget {
  const OnBoardBottomOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      left: 18,
      right: 18,
      child: BlocBuilder<OnbordingCubit, OnbordingState>(
        builder: (context, state) {
          final controller = context.read<OnbordingCubit>();
          return Row(
            children: [
              TextButton(
                onPressed: () {
                  GoRouter.of(context).go(PagesKeys.homePage);
                },
                child: Text(
                  controller.currentPage >= 2 ? "بدء الإستخدام" : "تخطي",
                  style: AppTextStyle.font16Regular.copyWith(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ),
              const Spacer(),
              controller.currentPage >= 2
                  ? const SizedBox()
                  : CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        controller.currentPage++;
                        controller.pageController.animateToPage(
                          controller.currentPage,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeIn,
                        );
                      },
                      minimumSize: const Size(0, 0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        child: const Icon(
                          CupertinoIcons.chevron_left,
                          color: Colors.white38,
                        ),
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}
