import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_360/core/const/app_colors.dart';
import 'package:task_360/core/const/app_sizes.dart';
import 'package:task_360/core/const/icons_path.dart';
import 'package:task_360/core/const/image_path.dart';
import 'package:task_360/core/global_widegts/app_text_button.dart';
import 'package:task_360/core/global_widegts/custom_size_box.dart';
import 'package:task_360/core/global_widegts/custom_text_popins.dart';
import 'package:task_360/core/global_widegts/social_button.dart';
import 'package:task_360/core/route/routes.dart';
import 'package:task_360/feature/auth/login/controller/login_controller.dart';
import 'package:task_360/core/global_widegts/custom_submit_button.dart';
import 'package:task_360/core/global_widegts/custom_text.dart';
import 'package:task_360/core/global_widegts/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                topSizeBox(),
                CustomTextPopins(
                  text: "Sign In",
                  fontSize: getWidth(30, maxWidth: 32),
                  fontWeight: FontWeight.w500,
                ),

                CustomText(
                  text: "Let’s save environment together",
                  fontSize: getWidth(14, maxWidth: 16),
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: 120),
                //textfiled section
                SizedBox(
                  child: Column(
                    children: [
                      CustomTextfield(
                        controller: controller.emailController,
                        title: "Email",
                        hintext: "user@example.com",
                      ),
                      SizedBox(height: 16),

                      Obx(
                        () => CustomTextfield(
                          controller: controller.passwordController,
                          hintext: "**********",
                          title: "Password",

                          obsecureText: controller.isPasswordHidden.value,
                          suffixIcon: InkWell(
                            onTap: controller.togglePasswordVisibility,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset(
                                IconsPath.eye,
                                width: 18,
                                height: 6.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    AppTextButton(
                      text: "Forgot Password?",
                      onTap: () {
                        Get.toNamed(AppRoutes.resetType);
                      },
                      fontWeight: FontWeight.w700,
                      textSize: getWidth(14, maxWidth: 16),
                      textColor: AppColors.primaryColor,
                    ),
                  ],
                ),
                SizedBox(height: 52),

                CustomSubmitButton(text: "Sign In", onTap: () {}),
                SizedBox(height: 42),
                Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    text: "Or Sign In with",
                    color: AppColors.textGrey,
                    fontSize: getWidth(12, maxWidth: 14),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(icon: IconsPath.facebook, onTap: () {}),
                    SizedBox(width: 10),
                    SocialButton(icon: IconsPath.google, onTap: () {}),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: "Don’t have an account? ",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    AppTextButton(
                      text: "Sign Up",
                      onTap: () {
                        Get.toNamed(AppRoutes.registration);
                      },
                      fontWeight: FontWeight.w600,
                      textSize: 16,
                      textColor: AppColors.primaryColor,
                    ),
                  ],
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
