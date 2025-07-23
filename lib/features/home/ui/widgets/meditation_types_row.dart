import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:soulsync/core/helpers/spacing.dart';
import 'package:soulsync/core/theming/text_styles.dart';
import 'package:soulsync/core/theming/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MeditationTypesRow extends StatelessWidget {
  const MeditationTypesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        Container(
          width: 72.21.w,
          height: 75.71.h,
          color: ColorManager.whiteWith90Opacity,
          child: SvgPicture.asset("assets/svgs/calm_icon.svg"),
        ),
        verticalSpace(4),
        Text("calm",style: TextStyles.whiteAlegreyaSans12Regular,),
      ],
    );
  }
}
