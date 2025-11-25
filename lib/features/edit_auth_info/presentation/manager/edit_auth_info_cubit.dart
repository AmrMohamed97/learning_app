import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:talamiz_arina/features/edit_auth_info/data/repo/edit_auth_info_repo.dart';
import 'package:talamiz_arina/features/edit_auth_info/presentation/manager/edit_auth_info_state.dart';

@injectable
class EditAuthInfoCubit extends Cubit<EditAuthInfoState> {
  final EditAuthInfoRepo _EditAuthInfoRepo;

  EditAuthInfoCubit(this._EditAuthInfoRepo) : super(EditAuthInfoInitial()) {
    currentPasswordController.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        validate();
      });
    });
    newPasswordController.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        validate();
      });
    });
    confirmNewPasswordController.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        validate();
      });
    });
    emailPasswordController.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        validate();
      });
    });
    phonePasswordController.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        validate();
      });
    });
  }
  ValueNotifier<bool> isButtonEnabled = ValueNotifier(false);
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
  final TextEditingController phonePasswordController = TextEditingController();
  final TextEditingController emailPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String email = "mmm@gmail.com";
  final String phone = "01011499348";

  int currentIndex = 0;

  void validate() {
    final bool isValid;
    if (currentIndex == 0) {
      isValid =
          newPasswordController.text.isNotEmpty &&
          confirmNewPasswordController.text.isNotEmpty &&
          currentPasswordController.text.isNotEmpty;
    } else {
      isValid =
          phonePasswordController.text.isNotEmpty &&
          phonePasswordController.text != phone &&
          emailPasswordController.text != email &&
          emailPasswordController.text.isNotEmpty;
    }
    isButtonEnabled.value = isValid;
  }

  @override
  Future<void> close() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    phonePasswordController.dispose();
    emailPasswordController.dispose();
    return super.close();
  }
}
