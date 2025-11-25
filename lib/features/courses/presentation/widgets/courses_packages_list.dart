import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/widgets/course_widget.dart';
import 'package:talamiz_arina/features/home/presentation/widgets/courses_list.dart';
import 'package:talamiz_arina/features/home/presentation/widgets/teachers_list.dart';

class CoursesPackagesList extends StatefulWidget {
  const CoursesPackagesList({super.key});

  @override
  State<CoursesPackagesList> createState() => _CoursesPackagesListState();
}

class _CoursesPackagesListState extends State<CoursesPackagesList> {
  final teacher = Teacher(
    id: '1',
    name: 'محمد العتيبي',
    title: 'معلم رياضيات و قدرات بخبرة 20 عام',
    experience: '20 عام',
    pricePerHalfHour: 50.0,
    profileImageUrl:
        'https://firebasestorage.googleapis.com/v0/b/zad-al-daia.firebasestorage.app/o/a5e70ce43db5770ad0b98944601e3f8bb9a83c1c.jpg?alt=media&token=ec23e7af-95d1-4f3a-b6c3-463532bbad0f',
    isVerified: true,
    isFavorite: false,
    subjects: [
      'الجبر',
      'الحساب',
      'الرياضيات الأساسية',
      'بيولوجيا',
      'حساب التفاضل',
      'فيزياء',
      'كيمياء',
      'هندسة',
      'فلسفة',
    ],
    languages: ['إنجليزي', 'العربي'],
    rating: 4.4,
    totalReviews: 30,
    totalStudents: 674,
    totalHoursTaught: 45,
  );
  late final course = Course(
    id: '1',
    title: 'الفيزياء العامة | فيز 1103 النظري والعملي',
    subject: 'علم فيزياء',
    description: 'الجدول : الأحد / الثلاثاء الساعة 5 م',
    thumbnailUrl: 'https://example.com/physics-course.jpg',
    price: 75.0,
    discount: 25.0,
    courseType: CourseType.group,
    schedule: 'الأحد / الثلاثاء الساعة 5 م',
    scheduledDate: DateTime(2024, 9, 20),
    instructorIds: ['instructor_1'],
    instructorNames: ['حسن علي'],
    instructorImageUrls: ['https://example.com/instructor.jpg'],
    primaryInstructor: teacher,
    isFavorite: true,
    tags: ['فصل جماعية', 'باقة دراسية'],
    totalSeats: 20,
    enrolledStudents: 9,
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsetsDirectional.only(bottom: 20, top: index == 0 ? 8 : 0,start: 16,end: 16),
          child: CourseWidget(course: course),
        );
      },
    );
  }
}
