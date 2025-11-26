import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/widgets/custom_cached_image.dart';
import 'package:talamiz_arina/core/widgets/image_picker_bottom_sheet.dart';
import 'package:talamiz_arina/features/registration/presentation/manager/registration_cubit.dart';
import 'package:talamiz_arina/features/registration/presentation/manager/registration_state.dart';
import 'package:talamiz_arina/features/registration/presentation/widgets/dotted_border_placeholder.dart';

class ImageDottedBorder extends StatelessWidget {
  const ImageDottedBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<RegistrationCubit>(context);
        return LayoutBuilder(
          builder: (context, constraints) {
            final fullSize = constraints.maxWidth * .35;
            final iconSize = fullSize * 0.25;
            final editIconSize = fullSize * 0.11;

            return IntrinsicHeight(
              child: GestureDetector(
                onTap: () {
                  final registerubit = context.read<RegistrationCubit>();
                  showModalBottomSheet(
                    backgroundColor: Colors.white,
                    context: context,
                    builder: (context) => BlocProvider.value(
                      value: registerubit,
                      child: const ImagePickerBottomSheet(),
                    ),
                  );
                },
                child: SizedBox(
                  width: fullSize,
                  height: fullSize,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      //  if (cubit.image == null) {
                      cubit.image == null
                          ? const DottedBorderPlaceholder()
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(200),
                              child: cubit.image?.imgPath != null
                                  ? Image.file(
                                      width: fullSize,
                                      height: fullSize,
                                      File(cubit.image?.imgPath ?? ''),
                                      fit: BoxFit.cover,
                                    )
                                  : CustomCachedImage(
                                      url: cubit.image?.imgUrl ?? '',
                                      fit: BoxFit.cover,
                                    ),
                            ),
                      // }
                      // ValueListenableBuilder(
                      //   valueListenable: image,
                      //   builder: (context, image, child) {
                      //     // if (image == null) {
                      //     //   return const DottedBorderPlaceholder();
                      //     // } else {
                      //     //   return ClipRRect(
                      //     //     borderRadius: BorderRadius.circular(200),
                      //     //     child: image.imgPath != null
                      //     //         ? Image.file(
                      //     //             width: fullSize,
                      //     //             height: fullSize,
                      //     //             File(image.imgPath!),
                      //     //             fit: BoxFit.cover,
                      //     //           )
                      //     //         : CustomCachedImage(
                      //     //             url: image.imgUrl!,
                      //     //             fit: BoxFit.cover,
                      //     //           ),
                      //     //   );
                      //     // }
                      //   },
                      // ),
                      cubit.image == null
                          ? Align(
                              child: Icon(Icons.person_outline, size: iconSize),
                            )
                          : const SizedBox.shrink(),
                      // ValueListenableBuilder(
                      //   valueListenable: image,
                      //   builder: (context, image, child) {
                      // return image == null
                      //     ? Align(
                      //         child: Icon(Icons.person_outline, size: iconSize),
                      //       )
                      //     : const SizedBox.shrink();
                      //   },
                      // ),
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
      },
    );
  }
}
