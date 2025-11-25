import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/widgets/filter_tag.dart';

class FilterTagesRow extends StatelessWidget {
  final List<String> tages;
  final Function() onClose;
  const FilterTagesRow({super.key, required this.tages, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: tages.isEmpty
          ? const SizedBox.shrink(key: ValueKey("empty"))
          : Container(
              key: const ValueKey("full"),
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      List<Widget>.generate(tages.length, (index) {
                        return FilterTag<String>(
                          text: tages[index],
                          value: tages[index],
                          isChosen: true,
                          onTap: (value) {},
                        );
                      })..insert(
                        0,
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 10),
                          child: GestureDetector(
                            onTap: onClose,
                            child: const CircleAvatar(
                              radius: 20,
                              backgroundColor: MyColors.purpleLightHover,
                              child: Icon(
                                Icons.close,
                                color: MyColors.purpleNormalHover,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                ),
              ),
            ),
    );
  }
}
