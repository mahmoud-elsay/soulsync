import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatsContentWidget extends StatefulWidget {
  const StatsContentWidget({super.key});

  @override
  State<StatsContentWidget> createState() => _StatsContentWidgetState();
}

class _StatsContentWidgetState extends State<StatsContentWidget>
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
        child: Image.asset(
          'assets/images/Stats.png',
          width: double.infinity,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
