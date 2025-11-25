import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

import '../../core/const/app_const.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({
    super.key,
    required this.url,
    this.errorWidget,
    this.fit,
    this.height,
    this.width,
  });

  final String? url;
  final Widget? errorWidget;
  final BoxFit? fit;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit ?? BoxFit.cover,
      height: height,
      width: width,
      imageUrl: url == null || url!.isEmpty
          ? 'https://firebasestorage.googleapis.com/v0/b/zad-al-daia.firebasestorage.app/o/a5e70ce43db5770ad0b98944601e3f8bb9a83c1c.jpg?alt=media&token=ec23e7af-95d1-4f3a-b6c3-463532bbad0f'
          : url!.contains('http')
          ? url!
          : "${AppConstant.baseImageUrl}$url",
      placeholder: (context, url) => BlurHash(
        hash: 'LKO2:N%2Tw=w]~RBVZRi};RPxuwH',
        imageFit: fit ?? BoxFit.fill,
      ),
      errorWidget: (context, url, error) =>
          errorWidget ??
          BlurHash(
            hash: 'LKO2:N%2Tw=w]~RBVZRi};RPxuwH',
            imageFit: fit ?? BoxFit.fill,
          ),
    );
  }
}
