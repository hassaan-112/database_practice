import 'package:database_practice/res/routes/routes.dart';
import 'package:database_practice/res/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>
      GetMaterialApp(
        getPages: AppRoutes.appRoutes(),
        theme: AppTheme().light,
        darkTheme: AppTheme().dark,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
