abstract class Validator {
  static bool validateEmail(String email) {
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return emailRegex.hasMatch(email);
  }

  static bool validatePassword(String password) {
    final passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~])[A-Za-z\d!@#\$&*~]{8,}$',
    );
    return passwordRegex.hasMatch(password);
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'تأكيد كلمة المرور مطلوب';
    } else if (value != password) {
      return 'كلمة المرور غير متتاطبقة';
    } else {
      return null;
    }
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return 'الاسم مطلوب';
    } else {
      return null;
    }
  }

  static String? validateGender(String? value) {
    if (value == null || value.isEmpty) {
      return 'الجنس مطلوب';
    } else {
      return null;
    }
  }

  static String? validateText(String? value) {
    if (value == null || value.isEmpty) {
      return 'الحقل مطلوب';
    } else {
      return null;
    }
  }

  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return 'العنوان مطلوب';
    } else {
      return null;
    }
  }

  static String? validateQualification(String? value) {
    if (value == null || value.isEmpty) {
      return 'المؤهل مطلوب';
    } else {
      return null;
    }
  }

  static String? validateNumberId(String? value) {
    if (value == null || value.isEmpty) {
      return 'ادخل رقم عضوية صحيح';
    } else {
      return null;
    }
  }

  static String? validateJopName(String? value) {
    if (value == null || value.isEmpty) {
      return 'المسمى الوظيفى مطلوب';
    } else {
      return null;
    }
  }

  static String? validateJopDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'وصف الوظيفة مطلوب';
    } else {
      return null;
    }
  }

  static String? validateLocation(String? value) {
    if (value == null || value.isEmpty) {
      return 'محل الإقامة مطلوب';
    } else {
      return null;
    }
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'رقم الجوال مطلوب';
    } else if (value.length != 11) {
      return 'من فضلك أدخل رقم جوال صحيح';
    } else {
      return null;
    }
  }

  static String? validateNationalId(String? value) {
    if (value == null || value.isEmpty) {
      return 'رقم الهوية مطلوب';
    } else if (value.length < 10) {
      return 'من فضلك أدخل رقم هوية صحيح';
    } else {
      return null;
    }
  }

  static String? validateDateOfBirth(String? value) {
    if (value == null || value.isEmpty) {
      return 'التاريخ مطلوب';
    } else if (value.length < 10) {
      return 'من فضلك أدخل تاريخ صحيح';
    } else {
      return null;
    }
  }

  static String? validateDateOfDeath(String? value) {
    if (value == null || value.isEmpty) {
      return 'تاريخ الوفاة مطلوب';
    } else if (value.length < 10) {
      return 'من فضلك أدخل تاريخ وفاة صحيح';
    } else {
      return null;
    }
  }
}
