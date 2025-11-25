import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/features/registration/presentation/manager/registration_cubit.dart';

class AcceptPolicyWidget extends StatelessWidget {
  const AcceptPolicyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.2,
          child: ValueListenableBuilder(
            valueListenable: context.read<RegistrationCubit>().acceptPolicy,
            builder: (context, value, child) {
              return Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: value,
                onChanged: (value) {
                  context.read<RegistrationCubit>().acceptPolicy.value =
                      value ?? false;
                },
                side: const BorderSide(
                  color: MyColors.purpleNormal,
                  width: 1.1,
                ),
              );
            },
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontFamily: 'sf-arabic-rounded',
            ),
            children: [
              const TextSpan(text: 'أوافق على '),
              TextSpan(
                text: ' سياسة الاستخدام ',
                style: const TextStyle(
                  color: MyColors.purpleNormal,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // TODO: Navigate to Terms Screen
                  },
              ),
              const TextSpan(text: ' و '),
              TextSpan(
                text: 'خصوصية البيانات',
                style: const TextStyle(
                  color: MyColors.purpleNormal,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // TODO: Navigate to Privacy Policy Screen
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
