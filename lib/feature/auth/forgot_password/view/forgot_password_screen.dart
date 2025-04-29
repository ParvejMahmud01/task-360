import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:task_360/core/const/app_colors.dart';
import 'package:task_360/core/const/icons_path.dart';
import 'package:task_360/core/global_widegts/custom_appbar.dart';
import 'package:task_360/core/global_widegts/custom_submit_button.dart';
import 'package:task_360/core/global_widegts/custom_text.dart';
import 'package:task_360/core/global_widegts/custom_textfield.dart';
import 'package:task_360/core/route/routes.dart';
import 'package:task_360/feature/auth/forgot_password/controller/forgot_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final ForgotController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = Get.arguments ?? {};
    final String title = arguments["title"] ?? "Unknown";
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomAppBar(text: "Forgot Password?"),
            SizedBox(height: 44),

            CustomText(
              text: title == "E-mail"
                  ? "Enter you email address and we will send \nyou code"
                  : "Enter you phone number and we will send \nyou code",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textGrey,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextfield(
                  controller: controller.emailController,

                  hintext: title == "E-mail"
                      ? "Enter your email"
                      : "Enter your phone number",
                  title: title,
                  textInputType: title == "E-mail"
                      ? TextInputType.emailAddress
                      : TextInputType.number,
                  prefixIcon: controller.isIcon.value == true
                      ? Icon(Icons.email_outlined, color: AppColors.textGrey)
                      : Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Image.asset(IconsPath.phone),
                        ),
                ),
              ],
            ),
            Spacer(),
            CustomSubmitButton(
              text: "Send OTP",
              onTap: () {
                if (controller.emailController.text.isEmpty) {
                  EasyLoading.showError("Email/Phone Number is required");
                } else {
                  Get.toNamed(
                    AppRoutes.verifyOtp,
                    arguments: {"title": controller.emailController.text},
                  );
                }
              },
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
