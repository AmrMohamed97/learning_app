import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:talamiz_arina/core/models/image_data.dart';
import 'package:talamiz_arina/features/registration/data/repo/registration_repo.dart';
import 'package:talamiz_arina/features/registration/presentation/manager/registration_state.dart';

@injectable
class RegistrationCubit extends Cubit<RegistrationState> {
  final RegistrationRepo registrationRepo;
  final ValueNotifier<int> tabIndex = ValueNotifier(0);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController curriculumController = TextEditingController();
  final TextEditingController gradeController = TextEditingController();
  final ValueNotifier<bool> acceptPolicy = ValueNotifier(false);
  final ValueNotifier<bool> isValid = ValueNotifier(false);
  final ValueNotifier<String?> gender = ValueNotifier(null);
  final ValueNotifier<ImageData?> image = ValueNotifier(null);

  RegistrationCubit(this.registrationRepo) : super(RegistrationInitial()) {
    nameController.addListener(() {
      validate();
    });
    emailController.addListener(() {
      validate();
    });
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

    gradeController.addListener(() {
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
            gradeController.text.isNotEmpty;
      } else if (tabIndex.value == 3) {
        isValid.value =
            phoneController.text.isNotEmpty &&
            passwordController.text.isNotEmpty &&
            acceptPolicy.value;
      }
    });
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    tabIndex.dispose();
    isValid.dispose();
    gender.dispose();
    return super.close();
  }
}
