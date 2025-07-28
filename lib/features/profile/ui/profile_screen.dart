import 'package:flutter/material.dart';
import 'package:soulsync/core/helpers/spacing.dart';
import 'package:soulsync/core/widgets/app_top_bar.dart';
import 'package:soulsync/core/theming/color_manager.dart';
import 'package:soulsync/features/profile/ui/widgets/profile_info_widget.dart';
import 'package:soulsync/features/profile/ui/widgets/stats_content_widget.dart';
import 'package:soulsync/features/profile/ui/widgets/stats_achievements_toggle.dart';
import 'package:soulsync/features/profile/ui/widgets/achievements_content_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isStatsSelected = true;

  void _handleToggle(bool isStats) {
    setState(() {
      isStatsSelected = isStats;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // App Top Bar
              const AppTopBar(),
              
              verticalSpace(40),
              
              // Profile Info Section
              const ProfileInfoWidget(),
              
              verticalSpace(40),
              
              // Stats and Achievements Toggle
              StatsAchievementsToggle(
                onToggle: _handleToggle,
                isStatsSelected: isStatsSelected,
              ),
              
              verticalSpace(32),
              
              // Content Section
              if (isStatsSelected)
                const StatsContentWidget()
              else
                const AchievementsContentWidget(),
              
              verticalSpace(100), // Space for bottom navigation
            ],
          ),
        ),
      ),
    );
  }
}