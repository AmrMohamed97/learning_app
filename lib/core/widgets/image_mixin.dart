import 'dart:io';

// import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

mixin ImageMixin {
  final imagePicker = ImagePicker();
  bool isNoPhoto = true;
  //  Future<File> compress({
  //   required File image,
  // }) async {
  //   ImageProperties properties =
  //       await FlutterNativeImage.getImageProperties(image.path);
  //   final path = await FlutterNativeImage.compressImage(image.path,
  //       quality: 90,
  //       targetWidth: 600,
  //       targetHeight: (properties.height! * 600 / properties.width!).round());

  //   return path;
  // }

  //-----------------------------------------------------------------------------------------------------
  Future<File> compress({required File targetImage}) async {
    img.Image? image = img.decodeImage(targetImage.readAsBytesSync());
    //lossless compression :just menimize width and height
    img.Image resizedImage = img.copyResize(
      image!,
      width: 600,
      height: 1024,
    ); //width:image.width, height:image.height);
    //lossy compression : menimize quality or resolution
    List<int> compressedBytes = img.encodeJpg(resizedImage, quality: 90);
    // get extention of target image
    String extention = targetImage.path.split('.').last;
    // change extention to compressed extention
    File compressedFile = File(
      targetImage.path.replaceAll(
        RegExp(r'\.[^\.]+$'),
        '_compressed.$extention',
      ),
    );
    //do render for new image
    compressedFile.writeAsBytesSync(compressedBytes);

    // _sizeAfterCompression = compressedFile.lengthSync();   //size after compression
    return compressedFile;
    //------------------------------------------------------------------------------
    // img.Image? image = img.decodeImage(targetImage.readAsBytesSync());

    // // Resize the image to have the longer side be 800 pixels
    // int width;
    // int height;

    // if (image!.width > image.height) {
    //   width = 800;
    //   height = (image.height / image.width * 800).round();
    // } else {
    //   height = 800;
    //   width = (image.width / image.height * 800).round();
    // }

    // img.Image resizedImage =
    //     img.copyResize(image, width: width, height: height);

    // // Compress the image with JPEG format
    // List<int> compressedBytes =
    //     img.encodeJpg(resizedImage, quality: 85); // Adjust quality as needed

    // // Save the compressed image to a file
    // File compressedFile =
    //     File(targetImage.path.replaceFirst('.png', '_compressed.png'));
    // compressedFile.writeAsBytesSync(compressedBytes);

    // return compressedFile;
  }
}
