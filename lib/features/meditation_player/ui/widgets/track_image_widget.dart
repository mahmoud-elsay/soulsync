import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackImageWidget extends StatelessWidget {
  final String? imagePath;

  const TrackImageWidget({
    super.key,
    this.imagePath = 'assets/images/track.png',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 284.w,
      height: 284.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(300.r),
        image: DecorationImage(
          image: AssetImage(imagePath!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
