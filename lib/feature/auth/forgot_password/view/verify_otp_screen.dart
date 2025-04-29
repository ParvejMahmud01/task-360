// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_360/core/const/app_colors.dart';
import 'package:task_360/core/global_widegts/app_text_button.dart';
import 'package:task_360/core/global_widegts/custom_appbar.dart';
import 'package:task_360/core/global_widegts/custom_submit_button.dart';
import 'package:task_360/core/global_widegts/custom_text.dart';
import 'package:task_360/core/route/routes.dart';
import 'package:task_360/feature/auth/forgot_password/controller/forgot_controller.dart';
import 'package:task_360/feature/auth/forgot_password/controller/otp_controller.dart';

class VerifyOtpScreen extends StatelessWidget {
  final OtpController otpController = Get.put(OtpController());
  final ForgotController forgotController = Get.find();

  VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = Get.arguments ?? {};
    final String title = arguments["title"] ?? "Unknown";
    return WillPopScope(
      onWillPop: () async {
        otpController.stopTimer(); // Stop timer on back
        return true;
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomAppBar(text: "Verification"),
              SizedBox(height: 42),
              SizedBox(width: 10),
              RichText(
                textAlign: TextAlign.center,

                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'We’ve the code send to your phone-\n',
                      style: GoogleFonts.inter(
                        color: AppColors.textBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: title,
                      style: GoogleFonts.inter(
                        color: AppColors.textBlack,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              OtpTextField(
                focusedBorderColor: AppColors.primaryColor,
                cursorColor: AppColors.primaryColor,

                fieldHeight: 55,
                fieldWidth: 55,
                decoration: InputDecoration(),
                fillColor: AppColors.primaryColor,
                borderWidth: 1.5,
                borderRadius: BorderRadius.circular(12),
                numberOfFields: 4,
                borderColor: AppColors.textGrey,
                showFieldAsBox: true,
                onCodeChanged: (String code) {
                  otpController.otp.value = code;
                },
                onSubmit: (String verificationCode) {
                  otpController.otp.value = verificationCode;
                },
                textStyle: GoogleFonts.inter(
                  color: AppColors.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              Obx(() {
                final minutes = (otpController.remainingTime.value ~/ 60)
                    .toString()
                    .padLeft(2, '0');
                final seconds = (otpController.remainingTime.value % 60)
                    .toString()
                    .padLeft(2, '0');
                return CustomText(
                  text: "$minutes:$seconds",
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlack,
                );
              }),
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Don’t receive code? ",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textGrey,
                  ),
                  AppTextButton(
                    text: "Resend Code",
                    onTap: () {
                      otpController.resetTimer();
                    },
                    fontWeight: FontWeight.w500,
                    textSize: 16,
                    textColor: AppColors.primaryColor,
                  ),
                ],
              ),
              Spacer(),
              CustomSubmitButton(
                text: "Verify",
                onTap: () {
                  if (otpController.otp.value.isEmpty) {
                    EasyLoading.showError("OTP is required");
                    return;
                  } else if (otpController.remainingTime.value <= 0) {
                    EasyLoading.showError(
                      "The OTP has expired. Please resend the code.",
                    );
                  } else {
                    // registrationController.verifyOtp();
                    print("object ${otpController.otp.value.toString()}");
                    Get.toNamed(AppRoutes.createNewPassword);
                  }
                },
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
