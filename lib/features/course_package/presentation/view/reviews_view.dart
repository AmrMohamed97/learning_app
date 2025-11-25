import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/features/course_package/presentation/widgets/review_item.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            Text('الآراء', style: AppTextStyle.font20SemiBold),
            16.verticalSpace,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 12,
                children: List.generate(10, (index) {
                  return const ReviewItem(
                    review:
                        'الأستاذ عبدالعزيز كان رائع جدًا! شرح الدروس بطريقة مبسطة وساعدني أفهم الرياضيات لأول مرة بدون تعقيد. كنت دائمًا أكره المادة، لكن الحصص معه كانت ممتعة وخلتني أتحسن في درجاتي بسرعة!',
                    name: 'احمد محمود',
                    description: ' طالب في الصف الثالث الثانوي',
                    rate: '4.5',
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
