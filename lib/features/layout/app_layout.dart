import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soulsync/features/home/ui/home_screen.dart';
import 'package:soulsync/features/library/ui/library_screen.dart';
import 'package:soulsync/features/profile/ui/profile_screen.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> with TickerProviderStateMixin {
  int selectedIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    LibraryScreen(),
    ProfileScreen(),
  ];

  final List<String> unselectedIcons = [
    'assets/svgs/home.svg',
    'assets/svgs/sound.svg',
    'assets/svgs/profile.svg',
  ];

  final List<String> selectedIcons = [
    'assets/svgs/selected_home.svg',
    'assets/svgs/selected_sound.svg',
    'assets/svgs/selected_profile.svg',
  ];

  void onItemTapped(int index) {
    if (index != selectedIndex) {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: screens),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 24.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                final isSelected = selectedIndex == index;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.w),
                  child: GestureDetector(
                    onTap: () => onItemTapped(index),
                    child: TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 300),
                      tween: Tween<double>(
                        begin: isSelected ? 0.9 : 1.0,
                        end: isSelected ? 1.2 : 1.0,
                      ),
                      curve: Curves.easeOutBack,
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: AnimatedOpacity(
                            opacity: isSelected ? 1.0 : 0.5,
                            duration: const Duration(milliseconds: 300),
                            child: SvgPicture.asset(
                              isSelected
                                  ? selectedIcons[index]
                                  : unselectedIcons[index],
                              height: 26.h,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
