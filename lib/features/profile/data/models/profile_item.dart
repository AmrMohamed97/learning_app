import 'package:flutter/material.dart';

class ProfileItem {
  final String title;
  final String img;
  final Widget? trailing;
  final Function() onTap;

  ProfileItem({
    required this.title,
    required this.img,
    this.trailing,
    required this.onTap,
  });
}
