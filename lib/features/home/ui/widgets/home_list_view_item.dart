import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soulsync/core/helpers/spacing.dart';
import 'package:soulsync/core/theming/text_styles.dart';
import 'package:soulsync/core/theming/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeListViewItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const HomeListViewItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 221.h,
      decoration: BoxDecoration(
        color: ColorManager.almond,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left Side: Texts & Button
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyles.darkSlateAlegreya32Medium),
                  verticalSpace(8),
                  Text(subtitle, style: TextStyles.blackAlegreyaSans18Medium),
                  const Spacer(),
                  SizedBox(
                    width: 152.w,
                    height: 42.96.h,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10.r),
                      onTap: () {},
                      child: Ink(
                        decoration: BoxDecoration(
                          color: ColorManager.darkSlate,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'watch now',
                              style: TextStyles.whiteAlegreyaSans15Medium,
                            ),
                            horizontalSpace(6.w),
                            SvgPicture.asset(
                              'assets/svgs/small_paly_icon.svg',
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

            horizontalSpace(16),

            // Right Side: Image
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  imagePath,
                  width: 140.w,
                  height: 190.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
