import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class PriceSlider extends StatefulWidget {
  final ValueChanged<RangeValues> onStepChanged;
  final RangeValues? values;
  const PriceSlider({super.key, required this.onStepChanged, required this.values});

  @override
  State<PriceSlider> createState() => _PriceSliderState();
}

class _PriceSliderState extends State<PriceSlider> {
  late RangeValues values = widget.values ?? const RangeValues(100, 2000);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text("السعر للساعة", style: AppTextStyle.font16SemiBold),
          const SizedBox(height: 18),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          values.start.round().toString(),
                          style: AppTextStyle.font16Medium.copyWith(
                            color: MyColors.purpleNormalHover,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Image.asset(
                          Assets.assetsImagesPngSAR,
                          color: MyColors.purpleNormalHover,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        values.end.round().toString(),
                        style: AppTextStyle.font16Medium.copyWith(
                          color: MyColors.purpleNormalHover,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Image.asset(
                        Assets.assetsImagesPngSAR,
                        color: MyColors.purpleNormalHover,
                      ),
                    ],
                  ),
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  rangeThumbShape: const RoundRangeSliderThumbShape(
                    enabledThumbRadius: 14,
                  ),
                ),
                child: RangeSlider(
                  activeColor: MyColors.purpleNormal,
                  inactiveColor: MyColors.darkBlueDark,
                  divisions: 1900,
                  values: values,
                  max: 2000,
                  min: 100,
                  onChanged: (RangeValues value) {
                    setState(() {
                      values = value;
                    });
                    widget.onStepChanged(value);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
