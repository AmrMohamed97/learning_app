import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:talamiz_arina/core/di/dependency_injection.dart';
import 'package:talamiz_arina/features/chat/presentation/views/chats_list_page.dart';
import 'package:talamiz_arina/features/courses/presentation/manager/courses_cubit.dart';
import 'package:talamiz_arina/features/courses/presentation/views/courses_page.dart';
import 'package:talamiz_arina/features/home/presentation/views/home_page.dart';
import 'package:talamiz_arina/features/main_bottom_nav/manager/main_bottom_nav_state.dart';
import 'package:talamiz_arina/features/timetable/presentation/manager/timetable_cubit.dart';
import 'package:talamiz_arina/features/timetable/presentation/views/timetable_page.dart';
import 'package:talamiz_arina/features/view_teachers/presentation/manager/home_cubit/view_teachers_cubit.dart';
import 'package:talamiz_arina/features/view_teachers/presentation/views/view_teachers_page.dart';

@injectable
class MainBottomNavCubit extends Cubit<MainBottomNavState> {
  MainBottomNavCubit() : super(MainBottomNavInitialState());
  int currentIndex = 0;
  final List<Widget> pages = [
    const HomePage(),
    BlocProvider(
      create: (context) => getIt<CoursesCubit>(),
      child: const CoursesPage(),
    ),
    const ChatsListPage(),
    BlocProvider(
      create: (context) => getIt<TimetableCubit>(),
      child: const TimetablePage(),
    ),
    BlocProvider(
      create: (context) => getIt<ViewTeachersCubit>(),
      child: const ViewTeachersPage(),
    ),
  ];
  void changePage(int index) {
    currentIndex = index;
    emit(ChangePageSuccess());
  }
}
