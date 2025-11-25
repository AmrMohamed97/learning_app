import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/models/image_data.dart';
import 'package:talamiz_arina/core/widgets/custom_cached_image.dart';
import 'package:talamiz_arina/core/widgets/image_picker_bottom_sheet.dart';

class ProfileImage extends StatelessWidget {
  final ValueNotifier<ImageData?> img;
  final double width;
  final double height;
  final bool editable;
  const ProfileImage({
    super.key,
    required this.img,
    this.width = 140,
    this.height = 140,
    this.editable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        width: width,
        height: height,
        child: InkWell(
          onTap: () {
            if (editable) {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ImagePickerBottomSheet(image: img);
                },
              );
            }
          },
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: ValueListenableBuilder(
                  valueListenable: img,
                  builder: (context, value, child) {
                    return value?.imgPath == null
                        ? CustomCachedImage(
                            width: width,
                            height: height,
                            url: value?.imgUrl,
                          )
                        : Image.file(
                            width: width,
                            height: height,
                            File(value!.imgPath!),
                          );
                  },
                ),
              ),
              if (editable)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(Assets.assetsImagesSvgEdit),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
