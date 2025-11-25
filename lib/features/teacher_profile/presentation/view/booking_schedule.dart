
import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/features/teacher_profile/presentation/widgets/custom_container.dart';
import 'package:talamiz_arina/features/teacher_profile/presentation/widgets/custom_date_picker.dart';

class Bookingschedule extends StatelessWidget {
  const Bookingschedule({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DatePickerScreen(
              onDateSelected: (date) => print('date print $date '),
            ),
            const SizedBox(height: 16),
              Text(
              'اختر من الأوقات المتاحة أدناه',
              style: AppTextStyle.font14Regular,
            ),
            const SizedBox(height: 16),
            ...List.generate(3, (index) {
              return const Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomContainer(
                        title: '3:30 مساءا',
                        borderColor: Colors.grey,
                        radius: 8,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: CustomContainer(
                        title: '3:30 مساءا',
                        borderColor: Colors.grey,
                        radius: 8,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
