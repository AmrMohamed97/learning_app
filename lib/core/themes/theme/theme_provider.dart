// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'custom_theme.dart';

// class ThemeProvider with ChangeNotifier {
//   ThemeData _themeData;
//   final String _themeKey = 'theme_mode';

//   ThemeProvider() : _themeData = lightTheme {
//     _loadTheme();
//   }

//   ThemeData get theme => _themeData;
//   bool get isDarkMode => _themeData.brightness == Brightness.dark;

//   Future<void> _loadTheme() async {
//     final prefs = await SharedPreferences.getInstance();
//     final isDark = prefs.getBool(_themeKey) ?? false;
//     _themeData = isDark ? darkTheme : lightTheme;
//     notifyListeners();
//   }

//   Future<void> toggleTheme() async {
//     final prefs = await SharedPreferences.getInstance();
//     if (_themeData.brightness == Brightness.light) {
//       _themeData = darkTheme;
//       await prefs.setBool(_themeKey, true);
//     } else {
//       _themeData = lightTheme;
//       await prefs.setBool(_themeKey, false);
//     }
//     notifyListeners();
//   }
// }
