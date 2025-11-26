import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talamiz_arina/core/routes/pages_keys.dart';
import 'package:talamiz_arina/core/widgets/teacher_widget.dart';
import 'package:talamiz_arina/core/widgets/title_tale.dart';

class TeachersList extends StatefulWidget {
  const TeachersList({super.key});

  @override
  State<TeachersList> createState() => _TeachersListState();
}

class _TeachersListState extends State<TeachersList> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleTale(
          title: "معلمون جاهزون لرفع أدائك",
          option: "مشاهدة الكل",
          onPressed: () {
            context.pushNamed(PagesKeys.viewTeachersPage);
          },
        ),
        const SizedBox(height: 20),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
            return TeacherWidget(teacher: teacher);
          },
        ),
      ],
    );
  }
}

class Teacher {
  final String id;
  final String name;
  final String title;
  final String experience;
  final double pricePerHalfHour;
  final String? profileImageUrl;
  final bool isVerified;
  final bool isFavorite;
  final List<String> subjects;
  final List<String> languages;
  final double rating;
  final int totalReviews;
  final int totalStudents;
  final int totalHoursTaught;

  Teacher({
    required this.id,
    required this.name,
    required this.title,
    required this.experience,
    required this.pricePerHalfHour,
    this.profileImageUrl,
    this.isVerified = false,
    required this.isFavorite,
    required this.subjects,
    required this.languages,
    required this.rating,
    required this.totalReviews,
    required this.totalStudents,
    required this.totalHoursTaught,
  });

  // Factory constructor to create from JSON
  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'] as String,
      name: json['name'] as String,
      title: json['title'] as String,
      experience: json['experience'] as String,
      pricePerHalfHour: (json['pricePerHalfHour'] as num).toDouble(),
      profileImageUrl: json['profileImageUrl'] as String?,
      isVerified: json['isVerified'] as bool? ?? false,
      isFavorite: json['isFavorite'] as bool? ?? false,
      subjects: List<String>.from(json['subjects'] as List),
      languages: List<String>.from(json['languages'] as List),
      rating: (json['rating'] as num).toDouble(),
      totalReviews: json['totalReviews'] as int,
      totalStudents: json['totalStudents'] as int,
      totalHoursTaught: json['totalHoursTaught'] as int,
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'title': title,
      'experience': experience,
      'pricePerHalfHour': pricePerHalfHour,
      'profileImageUrl': profileImageUrl,
      'isVerified': isVerified,
      'isFavorite': isFavorite,
      'subjects': subjects,
      'languages': languages,
      'rating': rating,
      'totalReviews': totalReviews,
      'totalStudents': totalStudents,
      'totalHoursTaught': totalHoursTaught,
    };
  }

  // Create a copy with updated fields
  Teacher copyWith({
    String? id,
    String? name,
    String? title,
    String? experience,
    double? pricePerHalfHour,
    String? profileImageUrl,
    bool? isVerified,
    bool? isFavorite,
    List<String>? subjects,
    List<String>? languages,
    double? rating,
    int? totalReviews,
    int? totalStudents,
    int? totalHoursTaught,
  }) {
    return Teacher(
      id: id ?? this.id,
      name: name ?? this.name,
      title: title ?? this.title,
      experience: experience ?? this.experience,
      pricePerHalfHour: pricePerHalfHour ?? this.pricePerHalfHour,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      isVerified: isVerified ?? this.isVerified,
      isFavorite: isFavorite ?? this.isFavorite,
      subjects: subjects ?? this.subjects,
      languages: languages ?? this.languages,
      rating: rating ?? this.rating,
      totalReviews: totalReviews ?? this.totalReviews,
      totalStudents: totalStudents ?? this.totalStudents,
      totalHoursTaught: totalHoursTaught ?? this.totalHoursTaught,
    );
  }

  @override
  String toString() {
    return 'TutorProfile(id: $id, name: $name, rating: $rating, price: $pricePerHalfHour)';
  }
}
