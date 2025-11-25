import 'package:flutter/material.dart';


class CustomTapView extends StatelessWidget {
  const CustomTapView({super.key, required this.tabs});
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    return TabBarView(children: tabs);
  }
}
