import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/widgets/my_text_form_field.dart';

class SendMessageWidget extends StatelessWidget {
  final bool isActive;
  const SendMessageWidget({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        16,
        16,
        16,
        MediaQuery.paddingOf(context).bottom + 16,
      ),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Expanded(
            child: MyTextFormField(
              hintText: "مراسلة",
              radius: 20,
              maxLines: 10,
              maxLength: 5000,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'الرجاء إدخال الرسالة';
                }
                return null;
              },
            ),
          ),
          const SizedBox(width: 8),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isActive ? MyColors.purpleNormal : Colors.transparent,
              border: Border.all(
                color: isActive
                    ? MyColors.purpleNormal
                    : MyColors.darkBlueNormalHover,
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.send,
              color: isActive ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
