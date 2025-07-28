import 'package:flutter/material.dart';
import 'package:soulsync/core/helpers/spacing.dart';
import 'package:soulsync/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackItemRow extends StatelessWidget {
  final String title;
  final String listeners;
  final String duration;
  final String imagePath;

  const TrackItemRow({
    super.key,
    required this.title,
    required this.listeners,
    required this.duration,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          // Track Image
          Container(
            width: 94.w,
            height: 94.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          horizontalSpace(12),

          // Title and Listeners
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyles.whiteAlegreyaSans24Medium),
                verticalSpace(4),
                Text(listeners, style: TextStyles.whiteAlegreyaSans15Light),
              ],
            ),
          ),

          // Duration
          Text(duration, style: TextStyles.whiteAlegreyaSans18Medium),
        ],
      ),
    );
  }
}
