import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soulsync/core/routes/routes.dart';
import 'package:soulsync/core/helpers/spacing.dart';
import 'package:soulsync/core/helpers/extension.dart';
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
      height: 230.h,
      decoration: BoxDecoration(
        color: ColorManager.almond,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            /// LEFT SIDE (Text + Button)
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: TextStyles.darkSlateAlegreya32Medium),
                  verticalSpace(8),
                  Text(
                    subtitle,
                    style: TextStyles.blackAlegreyaSans18Medium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                  verticalSpace(10),
                  Container(
                    width: 152.w,
                    height: 42.96.h,
                    decoration: BoxDecoration(
                      color: ColorManager.darkSlate,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10.r),
                      onTap: () {
                        context.pushNamed(Routes.meditationPlayer);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'watch now',
                            style: TextStyles.whiteAlegreyaSans15Medium,
                          ),
                          horizontalSpace(8.w),
                          SvgPicture.asset(
                            'assets/svgs/small_paly_icon.svg',
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

            horizontalSpace(12.w),

            /// RIGHT SIDE (Image)
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.only(right: 4.w),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14.r),
                  child: Image.asset(
                    imagePath,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.contain, // ensures image not cropped
                    filterQuality: FilterQuality.high,
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
