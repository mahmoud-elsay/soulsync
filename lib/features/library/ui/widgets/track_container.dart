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
      width: 223.w,
      height: 387.68.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        image: const DecorationImage(
          image: AssetImage('assets/images/track_rectangle.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, top: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Relax Sounds", style: TextStyles.whiteAlegreya32Medium),
            verticalSpace(8),
            SizedBox(
              width: 160.w,
              child: Text(
                "Sometimes the most productive thing you can do is relax.",
                style: TextStyles.whiteAlegreyaSans15Medium,
              ),
            ),
            const Spacer(),
            Container(
              width: 157.82.w,
              height: 44.6.h,
              margin: EdgeInsets.only(bottom: 16.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(10.r),
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
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
                        width: 14.w,
                        height: 14.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
