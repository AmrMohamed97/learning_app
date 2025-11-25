import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:talamiz_arina/features/courses/data/repo/courses_repo.dart';
import 'package:talamiz_arina/features/timetable/data/models/timetable_filter_model.dart';
import 'package:talamiz_arina/features/timetable/presentation/manager/timetable_state.dart';

@injectable
class TimetableCubit extends Cubit<TimetableState> {
  final CoursesRepo _coursesRepo;

  TimetableCubit(this._coursesRepo) : super(TimetableInitial());
  final ValueNotifier<TimetableFilterModel?> filter =
      ValueNotifier<TimetableFilterModel?>(null);
}
