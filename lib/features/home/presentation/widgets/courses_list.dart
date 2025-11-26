import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/widgets/course_widget.dart';
import 'package:talamiz_arina/core/widgets/title_tale.dart';
import 'package:talamiz_arina/features/home/presentation/widgets/teachers_list.dart';

class CoursesList extends StatefulWidget {
  const CoursesList({super.key});

  @override
  State<CoursesList> createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {
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
    return Column(
      children: [
        TitleTale(
          title: "الدورات",
          option: "مشاهدة الكل",
          onPressed: () {
            context.push(PagesKeys.coursesPage);
          },
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              3,
              (index) => Container(
                margin: const EdgeInsetsDirectional.only(end: 16),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: CourseWidget(course: course),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Course {
  final String id;
  final String title;
  final String subject;
  final String description;
  final String? thumbnailUrl;
  final double price;
  final double? discount;
  final CourseType courseType;
  final String schedule;
  final DateTime scheduledDate;
  final List<String> instructorIds;
  final List<String> instructorNames;
  final List<String>? instructorImageUrls;
  final Teacher? primaryInstructor;
  final bool isFavorite;
  final List<String> tags;
  final int? totalSeats;
  final int? enrolledStudents;

  Course({
    required this.id,
    required this.title,
    required this.subject,
    required this.description,
    this.thumbnailUrl,
    required this.price,
    this.discount,
    required this.courseType,
    required this.schedule,
    required this.scheduledDate,
    required this.instructorIds,
    required this.instructorNames,
    this.instructorImageUrls,
    this.primaryInstructor,
    this.isFavorite = false,
    this.tags = const [],
    this.totalSeats,
    this.enrolledStudents,
  });

  int? get availableSeats {
    if (totalSeats != null && enrolledStudents != null) {
      return totalSeats! - enrolledStudents!;
    }
    return null;
  }

  bool get isFull {
    if (availableSeats != null) {
      return availableSeats! <= 0;
    }
    return false;
  }

  double? get enrollmentPercentage {
    if (totalSeats != null && enrolledStudents != null && totalSeats! > 0) {
      return (enrolledStudents! / totalSeats!) * 100;
    }
    return null;
  }

  double get finalPrice {
    if (discount != null && discount! > 0) {
      return price - (price * discount! / 100);
    }
    return price;
  }

  bool get hasDiscount => discount != null && discount! > 0;

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] as String,
      title: json['title'] as String,
      subject: json['subject'] as String,
      description: json['description'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      price: (json['price'] as num).toDouble(),
      discount: json['discount'] != null
          ? (json['discount'] as num).toDouble()
          : null,
      courseType: CourseType.values.firstWhere(
        (e) => e.toString() == 'CourseType.${json['courseType']}',
        orElse: () => CourseType.group,
      ),
      schedule: json['schedule'] as String,
      scheduledDate: DateTime.parse(json['scheduledDate'] as String),
      instructorIds: List<String>.from(json['instructorIds'] as List),
      instructorNames: List<String>.from(json['instructorNames'] as List),
      instructorImageUrls: json['instructorImageUrls'] != null
          ? List<String>.from(json['instructorImageUrls'] as List)
          : null,
      primaryInstructor: json['primaryInstructor'] != null
          ? Teacher.fromJson(json['primaryInstructor'] as Map<String, dynamic>)
          : null,
      isFavorite: json['isFavorite'] as bool? ?? false,
      tags: json['tags'] != null ? List<String>.from(json['tags'] as List) : [],
      totalSeats: json['totalSeats'] as int?,
      enrolledStudents: json['enrolledStudents'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subject': subject,
      'description': description,
      'thumbnailUrl': thumbnailUrl,
      'price': price,
      'discount': discount,
      'courseType': courseType.name,
      'schedule': schedule,
      'scheduledDate': scheduledDate.toIso8601String(),
      'instructorIds': instructorIds,
      'instructorNames': instructorNames,
      'instructorImageUrls': instructorImageUrls,
      'primaryInstructor': primaryInstructor?.toJson(),
      'isFavorite': isFavorite,
      'tags': tags,
      'totalSeats': totalSeats,
      'enrolledStudents': enrolledStudents,
    };
  }

  Course copyWith({
    String? id,
    String? title,
    String? subject,
    String? description,
    String? thumbnailUrl,
    double? price,
    double? discount,
    CourseType? courseType,
    String? schedule,
    DateTime? scheduledDate,
    List<String>? instructorIds,
    List<String>? instructorNames,
    List<String>? instructorImageUrls,
    Teacher? primaryInstructor,
    bool? isFavorite,
    List<String>? tags,
    int? totalSeats,
    int? enrolledStudents,
  }) {
    return Course(
      id: id ?? this.id,
      title: title ?? this.title,
      subject: subject ?? this.subject,
      description: description ?? this.description,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      courseType: courseType ?? this.courseType,
      schedule: schedule ?? this.schedule,
      scheduledDate: scheduledDate ?? this.scheduledDate,
      instructorIds: instructorIds ?? this.instructorIds,
      instructorNames: instructorNames ?? this.instructorNames,
      instructorImageUrls: instructorImageUrls ?? this.instructorImageUrls,
      primaryInstructor: primaryInstructor ?? this.primaryInstructor,
      isFavorite: isFavorite ?? this.isFavorite,
      tags: tags ?? this.tags,
      totalSeats: totalSeats ?? this.totalSeats,
      enrolledStudents: enrolledStudents ?? this.enrolledStudents,
    );
  }

  @override
  String toString() {
    return 'Course(id: $id, title: $title, price: $price, type: $courseType)';
  }
}

enum CourseType { group, individual }

class CourseInstructor {
  final String id;
  final String name;
  final double rating;
  final String? imageUrl;

  CourseInstructor({
    required this.id,
    required this.name,
    required this.rating,
    this.imageUrl,
  });

  factory CourseInstructor.fromJson(Map<String, dynamic> json) {
    return CourseInstructor(
      id: json['id'] as String,
      name: json['name'] as String,
      rating: (json['rating'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'rating': rating, 'imageUrl': imageUrl};
  }
}
