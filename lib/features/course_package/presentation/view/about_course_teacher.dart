import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class AboutCourseTeacher extends StatelessWidget {
  const AboutCourseTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text('عن محمد العتيبي', style: AppTextStyle.font20Medium),
            Text(
              'معلم رياضيات معتمد خبرة طويلة في مجال تدريس الرياضيات بجميع فروعها لكل المراحل(ابتدائي/متوسط/ثانوي/سنة تحضيرية/قدرات كمية ولفظية/تحصيلي) ',
              style: AppTextStyle.font16Regular,
            ),
            const SizedBox(height: 16),
            const SpecializationView(
              title: 'المواد',
              specialization: ['الإحصاء', 'الهندسة', 'الجبر', 'حساب مثلثات'],
            ),
            const SizedBox(height: 16),
            const SpecializationView(
              title: 'اللغات',
              specialization: [
                'اللغة العربية',
                'اللغة الإنجليزية',
                'اللغة الفرنسية',
              ],
            ),
            Row(
              children: [
                Text('عن محمد العتيبي', style: AppTextStyle.font20Medium),
                Text('مشاهدة الكل', style: AppTextStyle.font20Medium),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SpecializationView extends StatelessWidget {
  const SpecializationView({
    super.key,
    required this.title,
    required this.specialization,
  });
  final String title;
  final List<String> specialization;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: AppTextStyle.font20Medium),
        if (specialization.isNotEmpty)
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              spacing: 4,
              children: [
                ...List.generate(specialization.length, (index) {
                  return Chip(
                    label: Text(
                      specialization[index],
                      style: AppTextStyle.font16Regular,
                    ),
                    backgroundColor: Colors.white,
                  );
                }),
              ],
            ),
          ),
      ],
    );
  }
}
