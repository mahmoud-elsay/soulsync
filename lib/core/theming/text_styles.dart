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
  static TextStyle lightGreyAlegreyaSans18Regular = GoogleFonts.alegreyaSans(
    fontSize: 18.sp,
    color: ColorManager.lightGrey,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle whiteAlegreyaSans18Regular = GoogleFonts.alegreyaSans(
    fontSize: 18.sp,
    color: ColorManager.white,
    fontWeight: FontWeightHelper.regular,
  );
}
