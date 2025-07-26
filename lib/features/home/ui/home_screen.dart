import 'package:flutter/material.dart';
import 'package:soulsync/core/helpers/spacing.dart';
import 'package:soulsync/core/theming/text_styles.dart';
import 'package:soulsync/core/widgets/app_top_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soulsync/features/home/ui/widgets/home_list_view.dart';
import 'package:soulsync/features/home/ui/widgets/meditation_types_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
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
                    const MeditationTypesRow(),
                    verticalSpace(24),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: const HomeListView(),
              ),
            ),
            SliverToBoxAdapter(child: verticalSpace(20)),
          ],
        ),
      ),
    );
  }
}
