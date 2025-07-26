import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soulsync/core/helpers/spacing.dart';
import 'package:soulsync/core/theming/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayerControlsWidget extends StatelessWidget {
  final bool isPlaying;
  final bool isInitialized;
  final VoidCallback onPlayPause;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;
  final VoidCallback? onShuffle;
  final VoidCallback? onRepeat;
  
  const PlayerControlsWidget({
    super.key,
    required this.isPlaying,
    required this.isInitialized,
    required this.onPlayPause,
    this.onPrevious,
    this.onNext,
    this.onShuffle,
    this.onRepeat,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Shuffle Button
        GestureDetector(
          onTap: onShuffle,
          child: SvgPicture.asset(
            'assets/svgs/random_icon.svg', 
            width: 28.w,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(isInitialized ? 1.0 : 0.5),
              BlendMode.srcIn,
            ),
          ),
        ),
        
        horizontalSpace(28.w),
        
        // Previous Button
        GestureDetector(
          onTap: onPrevious,
          child: SvgPicture.asset(
            'assets/svgs/back_icon.svg', 
            width: 28.w,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(isInitialized ? 1.0 : 0.5),
              BlendMode.srcIn,
            ),
          ),
        ),
        
        horizontalSpace(28.w),

        // Play/Pause Button
        InkWell(
          borderRadius: BorderRadius.circular(100.r),
          onTap: onPlayPause,
          child: Container(
            width: 85.w,
            height: 85.h,
            decoration: BoxDecoration(
              color: isInitialized ? Colors.white : Colors.grey,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isPlaying ? Icons.pause : Icons.play_arrow,
              size: 40.w,
              color: ColorManager.darkSlate,
            ),
          ),
        ),

        horizontalSpace(28.w),
        
        // Next Button
        GestureDetector(
          onTap: onNext,
          child: SvgPicture.asset(
            'assets/svgs/next_icon.svg', 
            width: 28.w,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(isInitialized ? 1.0 : 0.5),
              BlendMode.srcIn,
            ),
          ),
        ),
        
        horizontalSpace(28.w),
        
        // Repeat Button
        GestureDetector(
          onTap: onRepeat,
          child: SvgPicture.asset(
            'assets/svgs/sequence_icon.svg', 
            width: 28.w,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(isInitialized ? 1.0 : 0.5),
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}