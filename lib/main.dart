import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/dependency_injection/di.dart';
import 'package:movies/core/theme/app_theme.dart';
import 'package:movies/core/utils/app_routes.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movies',
        theme: AppTheme.darkTheme,
        initialRoute: AppRoutes.onboardingScreen.routeName,
        routes: AppRoutes.routes,
      ),
    );
  }
}
