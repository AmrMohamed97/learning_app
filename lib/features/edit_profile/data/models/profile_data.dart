class UserProfile {
  final String fullName;
  final String curriculum;
  final String grade;
  final String gender;
  final String? profileImageUrl;

  UserProfile({
    required this.fullName,
    required this.curriculum,
    required this.grade,
    required this.gender,
    this.profileImageUrl,
  });

  UserProfile copyWith({
    String? fullName,
    String? crriculum,
    String? grade,
    String? gender,
    String? profileImageUrl,
  }) {
    return UserProfile(
      fullName: fullName ?? this.fullName,
      curriculum: crriculum ?? curriculum,
      grade: grade ?? this.grade,
      gender: gender ?? this.gender,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'country': curriculum,
      'grade': grade,
      'gender': gender,
      'profileImageUrl': profileImageUrl,
    };
  }

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      fullName: json['fullName'] ?? '',
      curriculum: json['country'] ?? '',
      grade: json['grade'] ?? '',
      gender: json['gender'] ?? 'male',
      profileImageUrl: json['profileImageUrl'],
    );
  }

  @override
  String toString() {
    return 'UserProfile(fullName: $fullName, country: $curriculum, grade: $grade, gender: $gender, profileImageUrl: $profileImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserProfile &&
        other.fullName == fullName &&
        other.curriculum == curriculum &&
        other.grade == grade &&
        other.gender == gender &&
        other.profileImageUrl == profileImageUrl;
  }

  @override
  int get hashCode {
    return Object.hash(fullName, curriculum, grade, gender, profileImageUrl);
  }
}
