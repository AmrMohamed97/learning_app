import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/widgets/primary_button.dart';

class ActionButtonView extends StatelessWidget {
  const ActionButtonView({super.key, this.onReserve, this.onChat});
  final void Function()? onReserve, onChat;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: PrimaryButton(
              text: 'احجز الآن',
              onPressed: onReserve ?? () {},
            ),
          ),
          16.horizontalSpace,
          CupertinoButton(
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(0, 0),
            onPressed: onChat,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: MyColors.purpleNormal, width: 1.2),
              ),
              child: const Icon(
                Icons.chat_outlined,
                color: MyColors.purpleNormal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
