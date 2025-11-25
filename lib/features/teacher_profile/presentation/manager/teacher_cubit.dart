import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:talamiz_arina/features/teacher_profile/presentation/manager/teacher_state.dart';

@injectable
class TeacherCubit extends Cubit<TeacherState> {
  TeacherCubit() : super(TeatureInitial());
  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  String selectedValue = DateFormat("dd/MM/yyyy").format(DateTime.now());
}
