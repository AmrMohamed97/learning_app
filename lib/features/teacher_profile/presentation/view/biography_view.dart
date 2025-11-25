import 'package:flutter/material.dart';
import 'package:talamiz_arina/features/teacher_profile/presentation/widgets/about_teacher_item.dart';

class BiographyView extends StatelessWidget {
  const BiographyView({super.key});
  static const List<String> questions = [
    'الشهادات الجامعية',
    'الخبرات العملية',
    'الدورات التدريبية',
  ];
  static const List<String> answers = [
    'جامعة الأزهر\n2004-2008\nبكالوريوس - بكالوريوس العلوم والتربية قسم رياضيات',
    'معلم رياضيات - المرحلة الثانوية\nمدرسة الأفق الأهلية – الرياض، المملكة العربية السعودية\nالفترة : \nسبتمبر 2018 – يونيو 2024\nالوصف : \nمسؤول عن تدريس مناهج الرياضيات لطلاب المرحلة الثانوية باستخدام أساليب تعليم تفاعلية.إعداد خطط دروس أسبوعية متوافقة مع معايير وزارة التعليم.المتابعة المستمرة لأداء الطلاب وتقديم تغذية راجعة فردية لتحسين مستوياتهم\nالإنجازات : \nرفع متوسط درجات الطلاب بنسبة 25٪ خلال العام الدراسي 2023.تصميم أنشطة تعليمية رقمية جذبت أكثر من 400 طالب للمشاركة التفاعلية',
    'أساسيات التعليم الرقمي\nمدرسة الأفق الأهلية – الرياض، المملكة العربية السعودية\nالفترة : \nيناير 2024 – مارس 2024\nالوصف : \nدورة متخصصة في تطوير مهارات المعلمين في التعليم عن بُعد، تضمنت التدريب على أدوات الفصول الافتراضية، وتصميم محتوى تفاعلي للطلاب.\nالشهادات :\nشهادة إتمام معتمدة من الأكاديمية',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) => AboutTeacherItem(
        lessonNumber: '24:52',
        title: 'الدرس الأول : المفاهيم الأساسية',
        description: 'في هذا الدرس التمهيدي، ستتعرف على المفاهيم الأساسية...',
        date: '6/10/2025',
        status: 'locked', // أو 'active' أو 'recorded'
        onAttendLesson: () {},
        onDownloadNotes: () {},
      ),
    );
  }
}
