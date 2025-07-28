import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soulsync/core/helpers/spacing.dart';
import 'package:soulsync/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackContainer extends StatelessWidget {
  const TrackContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        image: const DecorationImage(
          image: AssetImage('assets/images/track_rectangle.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(15),
            Text("Relax Sounds", style: TextStyles.whiteAlegreya32Medium),
            verticalSpace(12),
            SizedBox(
              width: 200.w,
              child: Text(
                "Sometimes the most productive thing you can do is relax.",
                style: TextStyles.whiteAlegreyaSans15Medium,
              ),
            ),
            verticalSpace(27),
            Container(
              width: 157.82.w,
              height: 44.6.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(10.r),
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "play now",
                      style: TextStyles.blackAlegreyaSans15Medium,
                    ),
                    horizontalSpace(8),
                    SvgPicture.asset(
                      'assets/svgs/black_play_icon.svg',
                      width: 16.w,
                      height: 16.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
