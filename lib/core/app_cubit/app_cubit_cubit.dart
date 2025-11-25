import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/app_cubit/app_cubit_state.dart';
// import '../../core/const/app_const.dart';
// import '../../core/models/user_model/user_model.dart';
// import 'package:hive/hive.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  // UserModel? userModel;
  // Future<void> getUSerInfo() async {
  //    var box = Hive.box<UserModel>(StorageKeys.userBox);
  //   userModel = box.get(StorageKeys.userInfoBox);
  //   emit(GetUserInfo());
  // }

  // Future<void> assignUserData(UserModel userModel) async {
  //   var box = await Hive.openBox<UserModel>(StorageKeys.userInfoBox);
  //   await box.clear();
  //   await box.add(userModel);
  //   emit(AssignUser());
  //   // await box.put(
  //   //   StorageKeys.userInfoBox,
  //   //   UserModel(
  //   //     // deviceToken: ,
  //   //     email: userModel.email,
  //   //     id: userModel.id,
  //   //     imageUrl: userModel.imageUrl,
  //   //     roles: userModel.roles,
  //   //     username: userModel.username,
  //   //   ),
  //   // );
  // }
}
