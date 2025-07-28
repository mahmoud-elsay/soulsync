import 'package:flutter/material.dart';
import 'package:soulsync/core/helpers/spacing.dart';
import 'package:soulsync/core/theming/text_styles.dart';
import 'package:soulsync/core/theming/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatsAchievementsToggle extends StatefulWidget {
  final Function(bool) onToggle;
  final bool isStatsSelected;

  const StatsAchievementsToggle({
    super.key,
    required this.onToggle,
    required this.isStatsSelected,
  });

  @override
  State<StatsAchievementsToggle> createState() =>
      _StatsAchievementsToggleState();
}

class _StatsAchievementsToggleState extends State<StatsAchievementsToggle>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleToggle(bool isStats) {
    widget.onToggle(isStats);
    _animationController.reset();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          // Toggle Buttons
          Row(
            children: [
              horizontalSpace(45),
              GestureDetector(
                onTap: () => _handleToggle(true),
                child: Text(
                  "STATS",
                  style:
                      widget.isStatsSelected
                          ? TextStyles.whiteAlegreyaSans16Bold
                          : TextStyles.oliveGreenAlegreyaSans15Bold,
                ),
              ),

              horizontalSpace(120),

              GestureDetector(
                onTap: () => _handleToggle(false),
                child: Text(
                  "ACHIEVEMENTS",
                  style:
                      !widget.isStatsSelected
                          ? TextStyles.whiteAlegreyaSans16Bold
                          : TextStyles.oliveGreenAlegreyaSans15Bold,
                ),
              ),
            ],
          ),

          verticalSpace(16),

          // Animated Indicator
          Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: widget.isStatsSelected ? 212.26.w : 0,
                height: 3.h,
                decoration: BoxDecoration(
                  color: ColorManager.lightBlue,
                  borderRadius: BorderRadius.circular(1.5.r),
                ),
              ),
              const Spacer(),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: !widget.isStatsSelected ? 212.26.w : 0,
                height: 3.h,
                decoration: BoxDecoration(
                  color: ColorManager.lightBlue,
                  borderRadius: BorderRadius.circular(1.5.r),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
