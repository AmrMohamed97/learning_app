import 'package:flutter/src/material/range_slider_parts.dart';

class TimetableFilterModel {
  final Set<WeekDay> selectedDays;
  final Set<Subject> selectedSubjects;
  PriceRange priceRange;
  final List<TeachingMethod> selectedTeachingMethod;

  TimetableFilterModel({
    required this.selectedDays,
    required this.selectedSubjects,
    required this.priceRange,
    required this.selectedTeachingMethod,
  });

  Map<String, dynamic> toJson() => {
    'selectedDays': selectedDays.map((d) => d.name).toList(),
    'selectedSubjects': selectedSubjects.map((s) => s.name).toList(),
    'priceRange': priceRange.toJson(),
    'selectedTeachingMethod': selectedTeachingMethod
        .map((method) => method.name)
        .toList(),
  };

  factory TimetableFilterModel.fromJson(
    Map<String, dynamic> json,
  ) => TimetableFilterModel(
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

  TimetableFilterModel copyWith({
    Set<WeekDay>? selectedDays,
    Set<Subject>? selectedSubjects,
    PriceRange? priceRange,
    List<TeachingMethod>? selectedTeachingMethod,
  }) {
    return TimetableFilterModel(
      selectedDays: selectedDays ?? Set.from(this.selectedDays),
      selectedSubjects: selectedSubjects ?? Set.from(this.selectedSubjects),
      priceRange: priceRange ?? this.priceRange,
      selectedTeachingMethod:
          selectedTeachingMethod ?? List.from(this.selectedTeachingMethod),
    );
  }

  bool isEmpty() {
    return selectedDays.isEmpty &&
        selectedSubjects.isEmpty &&
        priceRange.minPrice == 0 &&
        priceRange.maxPrice == 0 &&
        selectedTeachingMethod.isEmpty;
  }
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
