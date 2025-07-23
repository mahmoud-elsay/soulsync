import 'package:flutter/material.dart';
import 'package:soulsync/core/helpers/spacing.dart';
import 'package:soulsync/core/theming/text_styles.dart';
import 'package:soulsync/core/widgets/app_top_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppTopBar(),
              verticalSpace(30),
              Text(
                'Welcome back, Afreen!',
                style: TextStyles.whiteAlegreyaSans32Medium,
              ),
              verticalSpace(5),
              Text(
                'How are you feeling today ?',
                style: TextStyles.whiteWith70OpacityAlegreyaSans22Regular,
              ),
              verticalSpace(24),
            ],
          ),
        ),
      ),
    );
  }
}
