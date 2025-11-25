import 'package:talamiz_arina/core/helper/date_helper.dart';
import 'package:talamiz_arina/features/home/presentation/widgets/teachers_list.dart';

// Private Lesson Data Class
class PrivateLesson {
  final String id;
  final Teacher teacher;
  final String subject;
  final DateTime startTime;
  final DateTime endTime;
  final double duration;
  final double totalPrice;
  final String? meetingLink;
  final String? notes;
  final DateTime bookingDate;

  PrivateLesson({
    required this.id,
    required this.teacher,
    required this.subject,
    required this.startTime,
    required this.endTime,
    required this.duration,
    required this.totalPrice,
    this.meetingLink,
    this.notes,
    required this.bookingDate,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'teacher': teacher.toJson(),
    'subject': subject,
    'startTime': startTime.toIso8601String(),
    'endTime': endTime.toIso8601String(),
    'duration': duration,
    'totalPrice': totalPrice,
    'meetingLink': meetingLink,
    'notes': notes,
    'bookingDate': bookingDate.toIso8601String(),
  };

  factory PrivateLesson.fromJson(Map<String, dynamic> json) => PrivateLesson(
    id: json['id'],
    teacher: Teacher.fromJson(json['teacher']),
    subject: json['subject'],
    startTime: DateTime.parse(json['startTime']),
    endTime: DateTime.parse(json['endTime']),
    duration: json['duration'],
    totalPrice: json['totalPrice'],
    meetingLink: json['meetingLink'],
    notes: json['notes'],
    bookingDate: DateTime.parse(json['bookingDate']),
  );

  String getLessonState() {
    if (startTime.isAfter(DateTime.now())) {
      return "قادمة";
    } else if (startTime.isBefore(DateTime.now()) &&
        endTime.isAfter(DateTime.now())) {
      return "جارية";
    } else {
      return "منتهية";
    }
  }

  String displyDate() {
    return "من ${DateHelper.formatTime12Hour(startTime)} إلى ${DateHelper.formatTime12Hour(endTime)}";
  }
}

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

final lesson = PrivateLesson(
  id: 'lesson_001',
  teacher: teacher,
  subject: 'حصة رياضيات',
  startTime: DateTime(2025, 11, 13, 13),
  endTime: DateTime(2025, 11, 13, 15),
  duration: 2.0,
  totalPrice: 200.0,
  bookingDate: DateTime.now(),
  notes: '1- ما هي نظرية فيثاغورث ؟',
);

final lessons = List.generate(10, (index) => lesson);
