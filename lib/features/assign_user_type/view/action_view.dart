import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/widgets/primary_button.dart';
import 'package:talamiz_arina/features/assign_user_type/widgets/user_type_item.dart';

class ActionView extends StatefulWidget {
  const ActionView({super.key});

  @override
  State<ActionView> createState() => _ActionViewState();
}

class _ActionViewState extends State<ActionView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        children: [
          const Expanded(child: SizedBox(height: 20)),
          Row(
            children: [
              const SizedBox(width: 16),
              UserTypeItem(
                onTap: () => setState(() {
                  selectedIndex = 1;
                }),
                image: 'assets/images/png/typeStudent.png',
                title: 'طالب',
                isSelected: selectedIndex == 1,
              ),
              const SizedBox(width: 16),
              UserTypeItem(
                onTap: () => setState(() {
                  selectedIndex = 2;
                }),
                isSelected: selectedIndex == 2,
                image: 'assets/images/png/typeParent.png',
                title: 'ولي أمر',
              ),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: PrimaryButton(
              backgroundColor: selectedIndex == 0
                  ? MyColors.darkBlueNormalHover
                  : null,
              textColor: selectedIndex == 0 ? Colors.black : null,
              isMax: true,
              text: 'دخول',
              onPressed: () {
                if (selectedIndex == 1) {
                  context.push(PagesKeys.loginPage);
                } else if (selectedIndex == 2) {
                  context.push(PagesKeys.loginPage);
                }
              },
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
