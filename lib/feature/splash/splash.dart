import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_360/feature/splash/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Center(child: Image.asset("assets/icons/splash.png")),
          Spacer(),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: const EdgeInsets.only(bottom: 50.0),
          //     child: SpinKitCircle(color: AppColors.primaryColor, size: 50),
          //   ),
          // ),
        ],
      ),
    );
  }
}
