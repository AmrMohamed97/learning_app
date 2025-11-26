import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:talamiz_arina/features/registration/data/models/curreculum_out_model/curriculum_out_model.dart';
import 'package:talamiz_arina/features/registration/data/models/stages_out_model/stages_out_model.dart';
import 'package:talamiz_arina/features/registration/data/repo/registration_repo.dart';
import 'package:talamiz_arina/features/registration/presentation/manager/stage_cubit/stage_state.dart';

@injectable
class StageCubit extends Cubit<StageState> {
  // final RegistrationRepo registrationRepo;
  StageCubit() : super(StageInitial());
  // StagesOutModel? stagesOutModel;
  // CurriculumOutModel? curriculumOutModel;
  final List<String> stages = [
    "رياض الأطفال",
    "الصف الأول",
    "الصف الثاني",
    "الصف الثالث",
    "الصف الرابع",
    "الصف الخامس",
    "الصف السادس",
    "الصف السابع",
    "الصف الثامن",
    "الصف التاسع",
    "الصف العاشر",
    "الصف الحادي عشر",
    "الصف الثاني عشر",
  ];

  final List<String> curriculum = ["المنهج السعودي", "المنهج المصري"];

  // Future<void> getStages() async {
  //   emit(StageLoading());
  //   final result = await registrationRepo.getStages();
  //   result.fold(
  //     ifLeft: (l) {
  //       emit(StageError(l.errorMassage));
  //     },
  //     ifRight: (r) {
  //       stagesOutModel = r;
  //       emit(StageSuccess(r));
  //     },
  //   );
  // }

  // Future<void> getCurriculum() async {
  //   emit(CurriculmLoading());
  //   final result = await registrationRepo.getCurriculum();
  //   result.fold(
  //     ifLeft: (l) {
  //       emit(CurriculumError(l.errorMassage));
  //     },
  //     ifRight: (r) {
  //       curriculumOutModel = r;
  //       emit(CurriculumSuccess(r));
  //     },
  //   );
  // }
}
