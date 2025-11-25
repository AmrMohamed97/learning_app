import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:talamiz_arina/features/course_package/presentation/manager/course_package_state.dart';


@injectable
class CoursePackageCubit extends Cubit<CoursePackageState> {
  CoursePackageCubit() : super(CoursePackageInitial());
  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  String selectedValue = DateFormat("dd/MM/yyyy").format(DateTime.now());
}
