import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talamiz_arina/core/helper/font_weight_helper.dart';
import 'package:talamiz_arina/core/models/image_data.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/widgets/my_button.dart';

class ImagePickerBottomSheet extends StatefulWidget {
  final ValueNotifier<ImageData?> image;
  const ImagePickerBottomSheet({super.key, required this.image});

  @override
  State<ImagePickerBottomSheet> createState() => _ImagePickerBottomSheetState();
}

class _ImagePickerBottomSheetState extends State<ImagePickerBottomSheet> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 16,
          top: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .2,
              height: 3,
              decoration: BoxDecoration(
                color: MyColors.darkBlueDarkActive,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 24),
            const Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                "اختر الطريقة المناسبة لتحميل الصورة",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
            ),
            const SizedBox(height: 28),
            MyButton(
              text: "معرض الصور",
              onPressed: () {
                _picker.pickImage(source: ImageSource.gallery).then((value) {
                  if (value != null) {
                    _cropImage(value);
                  }
                });
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 16),
            MyButton(
              text: "كاميرا",
              borderColor: MyColors.purpleNormalActive,
              color: Colors.transparent,
              textColor: MyColors.purpleNormalActive,
              onPressed: () {
                _picker.pickImage(source: ImageSource.camera).then((value) {
                  if (value != null) {
                    _cropImage(value);
                  }
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _cropImage(XFile pickedFile) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          hideBottomControls: false,
          lockAspectRatio: false,
        ),
        IOSUiSettings(title: 'Crop Image'),
      ],
    );

    if (croppedFile != null) {
      widget.image.value = ImageData(imgPath: croppedFile.path);
    }
  }
}
