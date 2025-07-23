import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soulsync/core/theming/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soulsync/core/theming/font_weight_helper.dart';

class TextStyles {
  static TextStyle whiteAlegreya40Bold = GoogleFonts.alegreya(
    fontSize: 40.sp,
    color: ColorManager.white,
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle whiteAlegreyaSans20Medium = GoogleFonts.alegreyaSans(
    fontSize: 20.sp,
    color: ColorManager.white,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle whiteAlegreyaSans12Regular = GoogleFonts.alegreyaSans(
    fontSize: 12.sp,
    color: ColorManager.white,
    fontWeight: FontWeightHelper.regular,
  );

  static TextStyle whiteAlegreyaSans25Medium = GoogleFonts.alegreyaSans(
    fontSize: 25.sp,
    color: ColorManager.white,
    fontWeight: FontWeightHelper.medium,
  );

  static TextStyle whiteAlegreyaSans20Bold = GoogleFonts.alegreyaSans(
    fontSize: 20.sp,
    color: ColorManager.white,
    fontWeight: FontWeightHelper.bold,
  );
  static TextStyle whiteAlegreyaSans32Medium = GoogleFonts.alegreyaSans(
    fontSize: 32.sp,
    color: ColorManager.white,
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle whiteWith70OpacityAlegreyaSans22Regular =
      GoogleFonts.alegreyaSans(
        fontSize: 22.sp,
        color: ColorManager.whiteWith70Opacity,
        fontWeight: FontWeightHelper.regular,
      );
  static TextStyle lightGreyAlegreyaSans18Regular = GoogleFonts.alegreyaSans(
    fontSize: 18.sp,
    color: ColorManager.lightGrey,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle lightGreyAlegreyaSans22Regular = GoogleFonts.alegreyaSans(
    fontSize: 22.sp,
    color: ColorManager.lightGrey,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle whiteAlegreyaSans18Regular = GoogleFonts.alegreyaSans(
    fontSize: 18.sp,
    color: ColorManager.white,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle whiteAlegreyaSans22Regular = GoogleFonts.alegreyaSans(
    fontSize: 22.sp,
    color: ColorManager.white,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle whiteAlegreya30Medium = GoogleFonts.alegreya(
    fontSize: 30.sp,
    color: ColorManager.white,
    fontWeight: FontWeightHelper.medium,
  );
}
