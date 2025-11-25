import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talamiz_arina/core/di/dependency_injection.dart';
import 'package:talamiz_arina/talamiz_arena.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await configureDependencies();
  runApp(const TalamizArena());
}
