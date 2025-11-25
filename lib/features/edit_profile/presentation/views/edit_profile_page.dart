import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talamiz_arina/core/widgets/my_button.dart';
import 'package:talamiz_arina/core/widgets/screen_wrapper.dart';
import 'package:talamiz_arina/features/edit_profile/data/models/profile_data.dart';
import 'package:talamiz_arina/features/edit_profile/presentation/manager/edit_profile_cubit.dart';
import 'package:talamiz_arina/features/edit_profile/presentation/widgets/user_info_filelds.dart';
import 'package:talamiz_arina/core/widgets/profile_image.dart';

class EditProfilePage extends StatefulWidget {
  final UserProfile userProfile;
  const EditProfilePage({super.key, required this.userProfile});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late final EditProfileCubit _editProfileCubit = context.read();

  @override
  void initState() {
    _editProfileCubit.init(widget.userProfile);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      maxWidth: 700,
      bottomNavigationBar: SafeArea(
        child: FractionallySizedBox(
          widthFactor: (700 / MediaQuery.of(context).size.width).clamp(0, 1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: ValueListenableBuilder(
              valueListenable: _editProfileCubit.isButtonEnabled,
              builder: (context, value, child) {
                return MyButton(
                  text: "حفظ التغييرات",
                  onPressed: value ? () {} : null,
                );
              },
            ),
          ),
        ),
      ),
      appBar: AppBar(title: const Text("تعديل البيانات الشخصية")),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 28),
              Hero(
                tag: "profile_img",
                child: ProfileImage(img: _editProfileCubit.imgValueNotifier),
              ),
              const SizedBox(height: 24),
              const UserInfoFilelds(),
            ],
          ),
        ),
      ),
    );
  }
}
