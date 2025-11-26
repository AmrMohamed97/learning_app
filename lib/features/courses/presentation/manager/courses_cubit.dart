import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:talamiz_arina/features/courses/data/models/filter_course_model.dart';
import 'package:talamiz_arina/features/courses/data/repo/courses_repo.dart';
import 'package:talamiz_arina/features/courses/presentation/manager/courses_state.dart';

@injectable
class CoursesCubit extends Cubit<CoursesState> {
  final CoursesRepo _coursesRepo;

  CoursesCubit(this._coursesRepo) : super(CoursesInitial());
  final ValueNotifier<FilterCourseModel?> filter = ValueNotifier<FilterCourseModel?>(null);

}
