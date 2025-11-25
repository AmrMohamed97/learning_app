import 'dart:io';

import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/models/image_data.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/widgets/custom_cached_image.dart';
import 'package:talamiz_arina/core/widgets/image_picker_bottom_sheet.dart';
import 'package:talamiz_arina/features/registration/presentation/widgets/dotted_border_placeholder.dart';

class ImageDottedBorder extends StatelessWidget {
  final ValueNotifier<ImageData?> image;
  const ImageDottedBorder({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final fullSize = constraints.maxWidth * .35;
        final iconSize = fullSize * 0.25;
        final editIconSize = fullSize * 0.11;

        return IntrinsicHeight(
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.white,
                context: context,
                builder: (context) => ImagePickerBottomSheet(image: image),
              );
            },
            child: SizedBox(
              width: fullSize,
              height: fullSize,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ValueListenableBuilder(
                    valueListenable: image,
                    builder: (context, image, child) {
                      if (image == null) {
                        return const DottedBorderPlaceholder();
                      } else {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: image.imgPath != null
                              ? Image.file(
                                  width: fullSize,
                                  height: fullSize,
                                  File(image.imgPath!),
                                  fit: BoxFit.cover,
                                )
                              : CustomCachedImage(
                                  url: image.imgUrl!,
                                  fit: BoxFit.cover,
                                ),
                        );
                      }
                    },
                  ),
                  ValueListenableBuilder(
                    valueListenable: image,
                    builder: (context, image, child) {
                      return image == null
                          ? Align(
                              child: Icon(Icons.person_outline, size: iconSize),
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                  PositionedDirectional(
                    bottom: fullSize * 0.01,
                    end: fullSize * 0.01,
                    child: CircleAvatar(
                      radius: editIconSize,
                      backgroundColor: MyColors.darkBlueNormalHover,
                      child: Icon(
                        size: editIconSize,
                        Icons.edit,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
