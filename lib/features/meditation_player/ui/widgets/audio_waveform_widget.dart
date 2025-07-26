import 'package:flutter/material.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AudioWaveformWidget extends StatelessWidget {
  final bool isInitialized;
  final PlayerController waveController;

  const AudioWaveformWidget({
    super.key,
    required this.isInitialized,
    required this.waveController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child:
          isInitialized
              ? AudioFileWaveforms(
                size: Size(320.w, 50.h),
                playerController: waveController,
                waveformType: WaveformType.fitWidth,
                enableSeekGesture: true,
                playerWaveStyle: PlayerWaveStyle(
                  fixedWaveColor: Colors.white.withOpacity(
                    0.6,
                  ), // More visible color for unplayed portion
                  liveWaveColor:
                      Colors.white, // Bright color for played portion
                  spacing: 4,
                  showSeekLine: false, // Remove seek line for cleaner look
                  waveCap: StrokeCap.round,
                  waveThickness: 2.5,
                  scaleFactor: 100, // Adjust wave height
                ),
              )
              : Container(
                width: 320.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                ),
              ),
    );
  }
}
