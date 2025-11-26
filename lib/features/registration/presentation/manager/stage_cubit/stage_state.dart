import 'package:talamiz_arina/features/registration/data/models/curreculum_out_model/curriculum_out_model.dart';
import 'package:talamiz_arina/features/registration/data/models/stages_out_model/stages_out_model.dart';

abstract class StageState {}

class StageInitial extends StageState {}

class StageLoading extends StageState {}

class StageSuccess extends StageState {
  final StagesOutModel stagesOutModel;
  StageSuccess(this.stagesOutModel);
}

class StageError extends StageState {
  final String error;
  StageError(this.error);
}

class CurriculmLoading extends StageState {}

class CurriculumSuccess extends StageState {
  final CurriculumOutModel curriculumOutModel;
  CurriculumSuccess(this.curriculumOutModel);
}

class CurriculumError extends StageState {
  final String error;
  CurriculumError(this.error);
}
