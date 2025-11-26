import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:talamiz_arina/core/helper/countries_codes.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class MyPhoneNumberFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffixIcon;

  const MyPhoneNumberFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.focusNode,
    this.onFieldSubmitted,
    this.suffixIcon,
  });

  @override
  State<MyPhoneNumberFormField> createState() => _MyPhoneNumberFormFieldState();
}

class _MyPhoneNumberFormFieldState extends State<MyPhoneNumberFormField> {
  late final TextEditingController _controller = TextEditingController();
  String _selectedCountryIsoCode = 'EG';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          focusNode: widget.focusNode,
          onFieldSubmitted: widget.onFieldSubmitted,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'رقم الهاتف مطلوب';
            }
            if (PhoneNumber.parse(
                  countryToPhoneCode[_selectedCountryIsoCode]! + value,
                ).isValid() ==
                false) {
              return 'رقم الهاتف غير صحيح';
            }

            return null;
          },
          onChanged: (value) => setState(() {
            widget.controller.value = TextEditingValue(
              text: PhoneNumber.parse(
                countryToPhoneCode[_selectedCountryIsoCode]! + value,
              ).international,
            );
          }),
          controller: _controller,
          keyboardType: TextInputType.phone,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsetsDirectional.only(end: 16),
              child: widget.suffixIcon,
            ),
            suffixIconConstraints: const BoxConstraints(),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 10,
            ),
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 8),
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    dropdownColor: Colors.white,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: MyColors.darkBlueDarkHover,
                      size: 18,
                    ),
                    value: _selectedCountryIsoCode,
                    selectedItemBuilder: (context) {
                      return countryToPhoneCode.entries.map((entry) {
                        return Center(
                          child: Text(
                            countryCodeToEmoji(entry.key),
                            style: AppTextStyle.font16Regular,
                          ),
                        );
                      }).toList();
                    },
                    items: countryToPhoneCode.entries.map((entry) {
                      return DropdownMenuItem<String>(
                        value: entry.key,
                        child: Text(
                          '${countryCodeToEmoji(entry.key)} ${entry.value}',
                          style: AppTextStyle.font16Regular.copyWith(
                            color: MyColors.darkBlueDarkHover,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        if (newValue == null) return;
                        _selectedCountryIsoCode = newValue;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  width: 1.5,
                  height: 24,
                  color: MyColors.greyLightActive,
                ),
                const SizedBox(width: 8),
              ],
            ),
            focusedBorder: _buildBorder(MyColors.purpleNormalActive),
            enabledBorder: _buildBorder(MyColors.greyLightHover),
            errorBorder: _buildBorder(Colors.red),
            focusedErrorBorder: _buildBorder(Colors.red),
            hintText: widget.hintText,
            hintStyle: AppTextStyle.font16Regular.copyWith(
              color: MyColors.darkBlueDarkHover,
            ),
          ),
        ),
      ],
    );
  }

  InputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color, width: 2),
    );
  }
}
