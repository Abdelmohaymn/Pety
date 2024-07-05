
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pety/shared/routing/app_router.dart';
import 'package:pety/shared/styles/themes.dart';

class PetyApp extends StatelessWidget {
  final AppRouter appRouter;
  final String initialRoute;
  const PetyApp({
    super.key,
    required this.appRouter,
    required this.initialRoute,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360,800),
      minTextAdapt: true,
      //useInheritedMediaQuery: true,
      builder: (_,child) {
        return MaterialApp(
          theme: lightTheme,
          debugShowCheckedModeBanner: false,
          scrollBehavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          initialRoute: initialRoute,
          onGenerateRoute: appRouter.generateRoute,
        );
      }
    );
  }
}