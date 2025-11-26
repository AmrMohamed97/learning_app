import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:talamiz_arina/core/helper/assets_helper.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';
import 'package:talamiz_arina/core/utills/validator.dart';

class MyTextFormField extends StatefulWidget {
  const MyTextFormField({
    super.key,
    this.hintText,
    this.textInputType,
    this.controller,
    this.onFieldSubmitted,
    this.minLine = 1,
    this.focusNode,
    this.obscureText,
    this.onSaved,
    this.validator,
    this.inputDecoration,
    this.prefixIcon,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.textStyle,
    this.counter,
    this.hintStyle,
    this.borderColor,
    this.borderWidth,
    this.radius,
    this.filled,
    this.filledColor,
    this.suffixIcon,
    this.suffixImg,
    this.textAlign,
    this.enabled,
    this.cursorColor,
    this.verticalPadding,
    this.horizontalPadding,
    this.cursorHieght,
    this.cursorWidth,
    this.inputFormatters,
    this.textDirection,
    this.autofillHints,
    this.readOnly,
    this.contentPadding,
    this.keyboardType,
    this.suffix,
    this.maxLines,
  });

  final String? hintText;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted, onChanged;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength, minLine;
  final double? borderWidth;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final FocusNode? focusNode;
  final bool? obscureText, filled, enabled, readOnly;
  final InputDecoration? inputDecoration;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? counter;
  final String? suffixImg;
  final TextStyle? textStyle, hintStyle;
  final Color? borderColor, filledColor, cursorColor;
  final TextDirection? textDirection;
  final Iterable<String>? autofillHints;
  final TextInputType? keyboardType;

  final double? radius,
      verticalPadding,
      horizontalPadding,
      cursorHieght,
      cursorWidth;
  final TextAlign? textAlign;

  final EdgeInsetsGeometry? contentPadding;

  final Widget? suffix;

  final int? maxLines;

  @override
  State<MyTextFormField> createState() => _MyFormTextFieldState();
}

class _MyFormTextFieldState extends State<MyTextFormField> {
  late bool _isObscure = widget.obscureText ?? false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      textAlign: widget.textAlign ?? TextAlign.start,
      validator:
          widget.validator ??
          (widget.obscureText == true
              ? (value) {
                  if (value == null || value.isEmpty) {
                    return "الرجاء إدخال كلمة المرور";
                  }
                  // if (!Validator.validatePassword(value)) {
                  //   return "يجب أن تحتوي كلمة المرور على 8 أحرف على الأقل، وتشمل حروفًا وأرقامًا";
                  // }
                  return null;
                }
              : null),
      enableInteractiveSelection: false,
      textDirection: widget.textDirection,
      readOnly: widget.readOnly ?? false,
      autofillHints: widget.autofillHints,
      inputFormatters: widget.inputFormatters,
      decoration:
          widget.inputDecoration ??
          InputDecoration(
            hintText: widget.hintText,
            hintStyle:
                widget.hintStyle ??
                AppTextStyle.font16Medium.copyWith(
                  color: MyColors.darkBlueDarkActive,
                ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.radius ?? 8),
            ),
            focusedBorder: _buildBorder(MyColors.purpleNormal),
            enabledBorder: _buildBorder(MyColors.greyLightHover),
            errorBorder: _buildBorder(Colors.red),
            focusedErrorBorder: _buildBorder(Colors.red),
            filled: widget.filled ?? false,
            fillColor: widget.filledColor,
            isDense: true,
            contentPadding:
                widget.contentPadding ??
                const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            prefixIcon: widget.prefixIcon,
            suffix: widget.suffix,
            suffixIconConstraints: const BoxConstraints(),
            suffixIcon: Padding(
              padding: const EdgeInsetsDirectional.only(end: 16),
              child:
                  widget.suffixIcon ??
                  (widget.obscureText != null || widget.suffixImg != null
                      ? GestureDetector(
                          onTap: widget.obscureText != null
                              ? () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }
                              : null,
                          child: SvgPicture.asset(
                            fit: BoxFit.scaleDown,
                            width: 24,
                            height: 24,
                            widget.suffixImg ??
                                (_isObscure
                                    ? Assets.assetsImagesSvgPasswordNotVisible
                                    : Assets.assetsImagesSvgPasswordNotVisible),
                          ),
                        )
                      : null),
            ),
            counter: widget.counter,
            counterText: "",
          ),
      cursorColor: widget.cursorColor ?? Colors.black,
      cursorHeight: widget.cursorHieght,
      cursorWidth: widget.cursorWidth ?? 2,
      keyboardType: widget.textInputType,
      controller: widget.controller,
      onFieldSubmitted: widget.onFieldSubmitted,
      onSaved: widget.onSaved,
      minLines: widget.minLine ?? 1,
      maxLines: widget.maxLines ?? 1,
      focusNode: widget.focusNode,
      obscureText: _isObscure,
      maxLengthEnforcement: widget.maxLengthEnforcement,
      maxLength: widget.maxLength ?? 40,
      onChanged: widget.onChanged,
      style: widget.textStyle ?? AppTextStyle.font16Medium,
    );
  }

  InputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.radius ?? 8),
      borderSide: BorderSide(color: color, width: 2),
    );
  }
}
