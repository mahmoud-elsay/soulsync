import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soulsync/core/helpers/spacing.dart';
import 'package:soulsync/core/theming/text_styles.dart';
import 'package:soulsync/core/theming/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MeditationTypesRow extends StatelessWidget {
  const MeditationTypesRow({super.key});

  Widget _buildItem(String iconPath, String label) {
    return Column(
      children: [
        Container(
          width: 72.21.w,
          height: 75.71.h,
          decoration: BoxDecoration(
            color: ColorManager.whiteWith90Opacity,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(child: SvgPicture.asset(iconPath, height: 32.h)),
        ),
        verticalSpace(4),
        Text(label, style: TextStyles.whiteAlegreyaSans12Regular),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildItem("assets/svgs/calm_icon.svg", "Calm"),
        _buildItem("assets/svgs/relax_icon.svg", "Relax"),
        _buildItem("assets/svgs/focus_icon.svg", "Focus"),
        _buildItem("assets/svgs/anxious_icon.svg", "Anxious"),
      ],
    );
  }
}
