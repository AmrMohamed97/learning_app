import 'package:flutter/src/material/range_slider_parts.dart';

class FilterTeacherModel {
  final List<TimeSlot> morningSlots;
  final List<TimeSlot> eveningSlots;
  final Set<WeekDay> selectedDays;
  final Set<Subject> selectedSubjects;
  PriceRange priceRange;
  final List<TeachingMethod> selectedTeachingMethod;

  FilterTeacherModel({
    required this.morningSlots,
    required this.eveningSlots,
    required this.selectedDays,
    required this.selectedSubjects,
    required this.priceRange,
    required this.selectedTeachingMethod,
  });

  Map<String, dynamic> toJson() => {
    'morningSlots': morningSlots.map((s) => s.toJson()).toList(),
    'eveningSlots': eveningSlots.map((s) => s.toJson()).toList(),
    'selectedDays': selectedDays.map((d) => d.name).toList(),
    'selectedSubjects': selectedSubjects.map((s) => s.name).toList(),
    'priceRange': priceRange.toJson(),
    'selectedTeachingMethod': selectedTeachingMethod
        .map((method) => method.name)
        .toList(),
  };

  factory FilterTeacherModel.fromJson(
    Map<String, dynamic> json,
  ) => FilterTeacherModel(
    morningSlots: (json['morningSlots'] as List)
        .map((s) => TimeSlot.fromJson(s))
        .toList(),
    eveningSlots: (json['eveningSlots'] as List)
        .map((s) => TimeSlot.fromJson(s))
        .toList(),
    selectedDays: (json['selectedDays'] as List)
        .map((d) => WeekDay.values.firstWhere((day) => day.name == d))
        .toSet(),
    selectedSubjects: (json['selectedSubjects'] as List)
        .map((s) => Subject.values.firstWhere((subj) => subj.name == s))
        .toSet(),
    priceRange: PriceRange.fromJson(json['priceRange']),
    selectedTeachingMethod: json['selectedTeachingMethod'] != null
        ? (json['selectedTeachingMethod'] as List)
              .map(
                (method) =>
                    TeachingMethod.values.firstWhere((m) => m.name == method),
              )
              .toList()
        : [],
  );

  FilterTeacherModel copyWith({
    List<TimeSlot>? morningSlots,
    List<TimeSlot>? eveningSlots,
    Set<WeekDay>? selectedDays,
    Set<Subject>? selectedSubjects,
    PriceRange? priceRange,
    List<TeachingMethod>? selectedTeachingMethod,
  }) {
    return FilterTeacherModel(
      morningSlots: morningSlots ?? List.from(this.morningSlots),
      eveningSlots: eveningSlots ?? List.from(this.eveningSlots),
      selectedDays: selectedDays ?? Set.from(this.selectedDays),
      selectedSubjects: selectedSubjects ?? Set.from(this.selectedSubjects),
      priceRange: priceRange ?? this.priceRange,
      selectedTeachingMethod:
          selectedTeachingMethod ?? List.from(this.selectedTeachingMethod),
    );
  }

  bool isEmpty() {
    return morningSlots.isEmpty &&
        eveningSlots.isEmpty &&
        selectedDays.isEmpty &&
        selectedSubjects.isEmpty &&
        priceRange.minPrice == 0 &&
        priceRange.maxPrice == 0 &&
        selectedTeachingMethod.isEmpty;
  }
}

class TimeSlot {
  final String startTime; // e.g., "4", "1", "11", "9"
  final String endTime; // e.g., "2", "12", "10", "8"
  final String amPm;
  final bool isSelected;

  TimeSlot({
    required this.startTime,
    required this.endTime,
    required this.amPm,
    this.isSelected = false,
  });

  String get displayTime => '$startTime $amPm - $endTime $amPm';

  Map<String, dynamic> toJson() => {
    'startTime': startTime,
    'endTime': endTime,
    'amPm': amPm,
    'isSelected': isSelected,
  };

  factory TimeSlot.fromJson(Map<String, dynamic> json) => TimeSlot(
    startTime: json['startTime'],
    endTime: json['endTime'],
    amPm: json['amPm'],
    isSelected: json['isSelected'] ?? false,
  );

  TimeSlot copyWith({bool? isSelected}) => TimeSlot(
    startTime: startTime,
    endTime: endTime,
    amPm: amPm,
    isSelected: isSelected ?? this.isSelected,
  );

  @override
  bool operator ==(Object other) {
    return other is TimeSlot &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.amPm == amPm;
  }

  @override
  int get hashCode => Object.hash(startTime, endTime, amPm);
}

enum WeekDay {
  sunday('الأحد', 'Sunday'),
  monday('الاثنين', 'Monday'),
  tuesday('الثلاثاء', 'Tuesday'),
  wednesday('الأربعاء', 'Wednesday'),
  thursday('الخميس', 'Thursday'),
  friday('الجمعة', 'Friday'),
  saturday('السبت', 'Saturday');

  final String nameArabic;
  final String nameEnglish;

  const WeekDay(this.nameArabic, this.nameEnglish);

  String getLocalizedName(bool isArabic) => isArabic ? nameArabic : nameEnglish;
}

enum Subject {
  geography('الجغرافيا', 'Geography'),
  economics('الاقتصاد', 'Economics'),
  biology('الأحياء', 'Biology'),
  sociology('الإحصاء', 'Sociology'),
  engineering('الهندسة', 'Engineering'),
  algebra('الجبر', 'Algebra'),
  history('التاريخ', 'History'),
  all('الكل', 'All');

  final String nameArabic;
  final String nameEnglish;

  const Subject(this.nameArabic, this.nameEnglish);

  String getLocalizedName(bool isArabic) => isArabic ? nameArabic : nameEnglish;
}

enum TeachingMethod {
  arabic('العربية', 'Arabic'),
  french('الفرنسية', 'French'),
  english('الإنجليزية', 'English'),
  german('الألمانية', 'German');

  final String nameArabic;
  final String nameEnglish;

  const TeachingMethod(this.nameArabic, this.nameEnglish);

  String getLocalizedName(bool isArabic) => isArabic ? nameArabic : nameEnglish;
}

class PriceRange {
  final int minPrice;
  final int maxPrice;

  PriceRange({required this.minPrice, required this.maxPrice});

  Map<String, dynamic> toJson() => {'minPrice': minPrice, 'maxPrice': maxPrice};

  factory PriceRange.fromJson(Map<String, dynamic> json) =>
      PriceRange(minPrice: json['minPrice'], maxPrice: json['maxPrice']);

  PriceRange copyWith({int? minPrice, int? maxPrice}) => PriceRange(
    minPrice: minPrice ?? this.minPrice,
    maxPrice: maxPrice ?? this.maxPrice,
  );

  RangeValues toRangeValues() =>
      RangeValues(minPrice.toDouble(), maxPrice.toDouble());
}
