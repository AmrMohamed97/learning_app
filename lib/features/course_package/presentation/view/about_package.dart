import 'package:flutter/material.dart';
import 'package:talamiz_arina/features/course_package/presentation/widgets/collection_sections.dart';
import 'package:talamiz_arina/features/course_package/presentation/widgets/expandable_text.dart';

class AboutPackage extends StatelessWidget {
  const AboutPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            DescriptionCard(
              title: 'وصف المادة',
              description:
                  'ابدأ رحلتك في تصميم واجهات وتجربة المستخدم (UI/UX) باستخدام Figma من الأساسيات وحتى تنفيذ مشاريع klflkjs lkja سيطمتن شبس تنمكشب شبتم  شنمتكب شكمتنشب سمكنت بش شبنمت بكشبسي شكسنميبت شكبمنسيت  واقعية خطوة بخطوة',
            ),
            SizedBox(height: 12),
            CollectionSections(),
          ],
        ),
      ),
    );
  }
}
