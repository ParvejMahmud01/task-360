import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_360/core/const/app_colors.dart';
import 'package:task_360/core/const/icons_path.dart';
import 'package:task_360/core/const/image_path.dart';
import 'package:task_360/core/global_widegts/app_text_button.dart';
import 'package:task_360/core/global_widegts/social_button.dart';
import 'package:task_360/core/route/routes.dart';
import 'package:task_360/feature/auth/login/controller/login_controller.dart';
import 'package:task_360/core/global_widegts/custom_submit_button.dart';
import 'package:task_360/core/global_widegts/custom_text.dart';
import 'package:task_360/core/global_widegts/custom_textfield.dart';
import 'package:task_360/feature/auth/registration/components/or_signup_with.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: AppColors.primaryColor),
        child: Column(
          children: [
            SizedBox(height: 100),
            SizedBox(height: 89, child: Image.asset(ImagePath.logo)),
            SizedBox(height: 30),
            Expanded(
              child: Container(
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        CustomText(
                          text: "Sign In Your Account",
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 24),

                        //textfiled section
                        SizedBox(
                          child: Column(
                            children: [
                              CustomTextfield(
                                controller: controller.emailController,
                                title: "User Name/Email",
                                hintext: "Enter your email/phone number",
                                obsecureText: true,
                              ),
                              SizedBox(height: 16),

                              Obx(
                                () => CustomTextfield(
                                  controller: controller.passwordController,
                                  hintext: "Enter your password",
                                  title: "Password",

                                  obsecureText:
                                      controller.isPasswordHidden.value,
                                  suffixIcon: InkWell(
                                    onTap: controller.togglePasswordVisibility,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Image.asset(
                                        controller.isPasswordHidden.value
                                            ? IconsPath.visibility
                                            : IconsPath.visibilityOff,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerRight,
                          child: AppTextButton(
                            text: "Forgot Password?",
                            onTap: () {
                              Get.toNamed(AppRoutes.resetType);
                            },
                            fontWeight: FontWeight.w400,
                            textSize: 14,
                            textColor: AppColors.textGrey,
                          ),
                        ),
                        SizedBox(height: 24),

                        SizedBox(height: 24),
                        CustomSubmitButton(
                          text: "Sign In",

                          onTap: () {
                            // showSuccessDialog(
                            //   message:
                            //       "You will be redirected to the home page in a few seconds",
                            //   onTap: () {},
                            // );

                            // Get.toNamed(AppRoutes.providerDashboard);
                          },
                        ),
                        SizedBox(height: 24),
                        OrSignUnWith(text: "Or Sign in with"),
                        SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SocialButton(
                              icon: IconsPath.facebook,
                              onTap: () {},
                            ),
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
            ),
          ],
        ),
      ),
    );
  }
}
