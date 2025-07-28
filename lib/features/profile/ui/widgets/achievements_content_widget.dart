import 'package:flutter/material.dart';
import 'package:soulsync/core/theming/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AchievementsContentWidget extends StatefulWidget {
  const AchievementsContentWidget({super.key});

  @override
  State<AchievementsContentWidget> createState() =>
      _AchievementsContentWidgetState();
}

class _AchievementsContentWidgetState extends State<AchievementsContentWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Container(
          height: 300.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Center(
            child: Text(
              "Achievements Coming Soon",
              style: TextStyles.whiteAlegreyaSans20Regular,
            ),
          ),
        ),
      ),
    );
  }
}
