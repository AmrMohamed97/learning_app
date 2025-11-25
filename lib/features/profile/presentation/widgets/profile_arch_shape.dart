import 'package:flutter/material.dart';

class ProfileArchShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - (size.height * 0.3));
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - (size.height * 0.3),
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
