import 'package:talamiz_arina/features/home/presentation/widgets/teachers_list.dart';

abstract class ViewTeachersState {}

class ViewTeachersInitial extends ViewTeachersState {}

class ViewTeachersLoading extends ViewTeachersState {}

class ViewTeachersSuccess extends ViewTeachersState {
  final List<Teacher> teachers;
  ViewTeachersSuccess({required this.teachers});
}
 
class ViewTeachersError extends ViewTeachersState {
  final String message;
  ViewTeachersError({required this.message});
}
