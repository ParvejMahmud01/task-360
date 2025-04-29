import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_360/core/const/app_colors.dart';
import 'package:task_360/core/const/app_sizes.dart';
import 'package:task_360/core/const/image_path.dart';
import 'package:task_360/core/global_widegts/custom_text.dart';
import 'package:task_360/feature/splash/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 41),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Center(
              child: Image.asset(
                ImagePath.logo,
                height: getHeight(214),
                width: getWidth(214),
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Powered by ',
                    style: GoogleFonts.inter(
                      color: AppColors.textGrey,
                      fontWeight: FontWeight.w400,
                      fontSize: getWidth(14, maxWidth: 16),
                    ),
                  ),
                  TextSpan(
                    text: 'M360 ICT',
                    style: GoogleFonts.inter(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: getWidth(14, maxWidth: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
