import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:talamiz_arina/core/const/app_const.dart';
import 'package:talamiz_arina/core/const/enums.dart';
import 'package:talamiz_arina/core/models/image_data.dart';
import 'package:talamiz_arina/core/utills/cache_helper.dart';
import 'package:talamiz_arina/core/widgets/image_mixin.dart';
import 'package:talamiz_arina/features/registration/data/models/curreculum_out_model/curriculum_item.dart';
import 'package:talamiz_arina/features/registration/data/models/register_input_model/register_input_model.dart';
import 'package:talamiz_arina/features/registration/data/models/stages_out_model/stage_item.dart';
import 'package:talamiz_arina/features/registration/data/repo/registration_repo.dart';
import 'package:talamiz_arina/features/registration/presentation/manager/registration_state.dart';

@injectable
class RegistrationCubit extends Cubit<RegistrationState> with ImageMixin {
  // final RegistrationRepo registrationRepo;
  final ValueNotifier<int> tabIndex = ValueNotifier(0);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  // final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController stageController = TextEditingController();
  final ValueNotifier<bool> acceptPolicy = ValueNotifier(false);
  final ValueNotifier<bool> isValid = ValueNotifier(false);
  final ValueNotifier<Gender?> gender = ValueNotifier(null);
  ValueNotifier<AutovalidateMode> autovalidateMode = ValueNotifier(
    AutovalidateMode.disabled,
  );
  ImageData? image;
  final TextEditingController curriculumController = TextEditingController();
  StageItem? selectedStage;
  CurriculumItem? selectedCrriculum;

  void assignImage(ImageData imageData) async {
    image = imageData;
    emit(AssignImageState());
    image!.image = await compress(targetImage: image!.image!);
  }

  RegistrationCubit() : super(RegistrationInitial()) {
    nameController.addListener(() {
      validate();
    });
    // emailController.addListener(() {
    //   validate();
    // });
    passwordController.addListener(() {
      validate();
    });
    phoneController.addListener(() {
      validate();
    });
    tabIndex.addListener(() {
      validate();
    });

    acceptPolicy.addListener(() {
      validate();
    });

    curriculumController.addListener(() {
      validate();
    });

    gender.addListener(() {
      validate();
    });

    stageController.addListener(() {
      validate();
    });
  }

  void validate() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (tabIndex.value == 0) {
        isValid.value = nameController.text.isNotEmpty;
      } else if (tabIndex.value == 1) {
        isValid.value = gender.value != null;
      } else if (tabIndex.value == 2) {
        isValid.value =
            curriculumController.text.isNotEmpty &&
            stageController.text.isNotEmpty;
      } else if (tabIndex.value == 3) {
        isValid.value =
            phoneController.text.isNotEmpty &&
            passwordController.text.isNotEmpty &&
            acceptPolicy.value;
      }
    });
  }

  // Future<void> register() async {
  //   emit(RegistrationLoading());
  //   final result = await registrationRepo.register(
  //     body: RegisterInputModel(
  //       fullName: nameController.text,
  //       phone: phoneController.text,
  //       password: passwordController.text,
  //       gender: '${gender.value}' == 'Gender.male' ? 'male' : 'female',
  //       curriculumId: selectedCrriculum?.id?.toString(),
  //       stageId: selectedStage?.id?.toString(),
  //       img: image?.image,
  //       type: CacheHelper.getData(key: AppConstant.userType),
  //       // dateOfBirth: DateFormat('yyyy-MM-dd').format(DateTime.now()),
  //     ),
  //   );
  //   result.fold(
  //     ifLeft: (l) {
  //       emit(RegistrationFailure(message: l.errorMassage));
  //     },
  //     ifRight: (r) {
  //       emit(RegistrationSuccess(r));
  //     },
  //   );
  // }

  @override
  Future<void> close() {
    nameController.dispose();
    // emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    tabIndex.dispose();
    isValid.dispose();
    gender.dispose();
    return super.close();
  }
}
