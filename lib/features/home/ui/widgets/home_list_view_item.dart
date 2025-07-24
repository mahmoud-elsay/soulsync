import 'package:flutter/widgets.dart';
import 'package:soulsync/core/theming/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeListViewItem extends StatelessWidget {
  const HomeListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 392.w,
      height: 221.h,
      decoration: BoxDecoration(
        color: ColorManager.almond,
        borderRadius: BorderRadius.circular(20.r),
      ),
    );
  }
}
