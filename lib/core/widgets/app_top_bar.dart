import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTopBar extends StatelessWidget {
  const AppTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'assets/svgs/menu_icon.svg',
            height: 24.h,
            width: 24.w,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),

          Image.asset('assets/images/logo_icon.png', height: 28.h),

          CircleAvatar(
            radius: 16.r,
            backgroundImage: const AssetImage('assets/images/person.png'),
          ),
        ],
      ),
    );
  }
}
