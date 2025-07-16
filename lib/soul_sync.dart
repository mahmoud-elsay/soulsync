import 'core/routes/routes.dart';
import 'core/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'core/theming/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SoulSync extends StatelessWidget {
  const SoulSync({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder:
          (context, child) => MaterialApp(
            title: 'SoulSync',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: ColorManager.darkSlate,
              primaryColor: ColorManager.teal,
            ),
            initialRoute: Routes.splashScreen,
            onGenerateRoute: AppRouter().generateRoute,
          ),
    );
  }
}
