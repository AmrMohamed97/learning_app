import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:talamiz_arina/features/view_teachers/data/models/filter_teacher_model.dart';
import 'package:talamiz_arina/features/view_teachers/presentation/manager/home_cubit/view_teachers_state.dart';

@Injectable()
class ViewTeachersCubit extends Cubit<ViewTeachersState> {
  ViewTeachersCubit() : super(ViewTeachersInitial());
  final ValueNotifier<FilterTeacherModel?> filter = ValueNotifier<FilterTeacherModel?>(null);
}
