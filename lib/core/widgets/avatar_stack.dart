import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/widgets/custom_cached_image.dart';

/// A widget that displays a stack of circular avatars with overlap effect
class AvatarStack extends StatelessWidget {
  /// List of image URLs or asset paths
  final List<String> images;

  /// Size of each avatar
  final double avatarSize;

  /// Percentage of overlap (0.0 to 1.0)
  final double overlapPercent;

  /// Border width around each avatar
  final double borderWidth;

  /// Border color around each avatar
  final Color borderColor;

  /// Maximum number of avatars to display
  final int? maxAvatars;

  /// Text style for the "+N" overflow indicator
  final TextStyle? overflowTextStyle;

  /// Background color for the overflow indicator
  final Color? overflowBackgroundColor;

  /// Whether images are network images or assets
  final bool isNetworkImage;

  const AvatarStack({
    super.key,
    required this.images,
    this.avatarSize = 60.0,
    this.overlapPercent = 0.3,
    this.borderWidth = 3.0,
    this.borderColor = Colors.white,
    this.maxAvatars,
    this.overflowTextStyle,
    this.overflowBackgroundColor,
    this.isNetworkImage = true,
  });

  @override
  Widget build(BuildContext context) {
    final displayCount = maxAvatars != null && images.length > maxAvatars!
        ? maxAvatars!
        : images.length;

    final overflow = maxAvatars != null && images.length > maxAvatars!
        ? images.length - maxAvatars!
        : 0;

    final overlapOffset = avatarSize * (1 - overlapPercent);
    final totalWidth =
        (displayCount - 1) * overlapOffset +
        avatarSize +
        (overflow > 0 ? overlapOffset : 0);

    return SizedBox(
      width: totalWidth,
      height: avatarSize,
      child: Stack(
        children: [
          ...List.generate(displayCount, (index) {
            return Positioned(
              left: index * overlapOffset,
              child: _buildAvatar(images[index]),
            );
          }),
          if (overflow > 0)
            Positioned(
              left: displayCount * overlapOffset,
              child: _buildOverflowIndicator(overflow),
            ),
        ],
      ),
    );
  }

  Widget _buildAvatar(String imageUrl) {
    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: ClipOval(
        child: isNetworkImage
            ? CustomCachedImage(url: imageUrl, fit: BoxFit.cover)
            : Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: Icon(Icons.person, color: Colors.grey[600]),
                  );
                },
              ),
      ),
    );
  }

  Widget _buildOverflowIndicator(int count) {
    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: overflowBackgroundColor ?? Colors.grey[800],
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: Center(
        child: Text(
          '+$count',
          style:
              overflowTextStyle ??
              TextStyle(
                color: Colors.white,
                fontSize: avatarSize * 0.25,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
