import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:talamiz_arina/core/models/image_data.dart';
import 'package:talamiz_arina/features/edit_profile/data/models/profile_data.dart';
import 'package:talamiz_arina/features/edit_profile/presentation/manager/edit_profile_state.dart';
import 'package:talamiz_arina/features/wallet/data/repo/wallet_repo.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState> {
  final WalletRepo _walletRepo;

  EditProfileCubit(this._walletRepo) : super(EditProfileInitial());
  ValueNotifier<bool> isButtonEnabled = ValueNotifier(false);
  late final TextEditingController nameController;
  late final TextEditingController gradeController;
  late final TextEditingController curriculumController;
  late final ValueNotifier<String> genderValueNotifier;
  late final ValueNotifier<ImageData> imgValueNotifier;
  late final UserProfile _userProfile;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Future<void> close() {
    gradeController.dispose();
    nameController.dispose();
    curriculumController.dispose();
    return super.close();
  }

  void init(UserProfile userProfile) {
    _userProfile = userProfile;
    nameController = TextEditingController(text: _userProfile.fullName);
    gradeController = TextEditingController(text: _userProfile.grade);
    curriculumController = TextEditingController(text: _userProfile.curriculum);
    genderValueNotifier = ValueNotifier(_userProfile.gender);
    imgValueNotifier = ValueNotifier(
      ImageData(imgUrl: _userProfile.profileImageUrl),
    );
    _addListeners();
  }

  bool _validate() {
    return (nameController.text.length > 3 &&
            nameController.text != _userProfile.fullName) ||
        curriculumController.text != _userProfile.curriculum ||
        genderValueNotifier.value != _userProfile.gender ||
        imgValueNotifier.value.imgPath != null;
  }

  void _addListeners() {
    nameController.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isButtonEnabled.value = _validate();
      });
    });
    curriculumController.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isButtonEnabled.value = _validate();
      });
    });
    gradeController.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isButtonEnabled.value = _validate();
      });
    });

    genderValueNotifier.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isButtonEnabled.value = _validate();
      });
    });

    imgValueNotifier.addListener(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isButtonEnabled.value = _validate();
      });
    });
  }
}
