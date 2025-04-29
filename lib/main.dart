import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:task_360/core/const/app_colors.dart';
import 'package:task_360/core/const/app_sizes.dart';
import 'package:task_360/core/route/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return GetMaterialApp(
      title: 'Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.white),
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.routes,
      builder: EasyLoading.init(),
    );
  }
}
