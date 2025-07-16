import 'package:flutter/material.dart';
import 'package:soulsync/core/theming/text_styles.dart';
import 'package:soulsync/core/theming/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        focusedBorder: focusedBorder ??
            UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.teal,
                width: 2.0,
              ),
            ),
        enabledBorder: enabledBorder ??
            UnderlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.lightGrey,
                width: 1.5,
              ),
            ),
        hintStyle: hintStyle ?? TextStyles.lightGreyAlegreyaSans18Regular,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: backgroundColor ?? Colors.transparent,
        filled: true,
        border: InputBorder.none,
      ),
      obscureText: isObscureText ?? false,
      style: inputTextStyle ?? TextStyles.whiteAlegreyaSans18Regular,
    );
  }
}