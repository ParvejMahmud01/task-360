import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_360/core/const/app_colors.dart';
import 'package:task_360/core/const/icons_path.dart';
import 'package:task_360/core/const/image_path.dart';
import 'package:task_360/core/global_widegts/social_button.dart';
import 'package:task_360/core/route/routes.dart';
import 'package:task_360/feature/auth/registration/components/custom_methods.dart';
import 'package:task_360/core/global_widegts/custom_submit_button.dart';
import 'package:task_360/core/global_widegts/custom_text.dart';
import 'package:task_360/core/global_widegts/custom_textfield.dart';
import 'package:task_360/feature/auth/registration/components/or_signup_with.dart';
import 'package:task_360/feature/auth/registration/controller/registration_controller.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});
  final RegistrationController controller = Get.put(RegistrationController());
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
                          text: "Create a New Account",
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 24),

                        //textfiled section
                        SizedBox(
                          child: Column(
                            children: [
                              CustomTextfield(
                                controller: controller.firstNameController,
                                title: "First Name",
                                hintext: "Enter your first name",
                                obsecureText: true,
                              ),
                              SizedBox(height: 16),
                              CustomTextfield(
                                controller: controller.lastNameController,
                                title: "Last Name",
                                hintext: "Enter your last name",
                                obsecureText: true,
                              ),
                              SizedBox(height: 16),
                              CustomTextfield(
                                controller: controller.emailController,
                                title: "Email",
                                hintext: "Enter your email",
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

                                  onChanged: controller.checkPasswordStrength,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Obx(() {
                          return Container(
                            height: 10,
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Color(0xffEDECEF),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: FractionallySizedBox(
                              widthFactor: controller.passwordStrength.value,
                              child: Container(
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Color(0xffFAAE16),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          );
                        }),

                        SizedBox(height: 12),
                        passwordConditionRow(
                          "8 characters minimum",
                          controller.hasMinLength,
                        ),
                        passwordConditionRow("a number", controller.hasNumber),
                        passwordConditionRow("a symbol", controller.hasSymbol),
                        SizedBox(height: 24),

                        //terms and condtion section
                        Row(
                          children: [
                            Obx(
                              () => InkWell(
                                onTap: () {
                                  controller.toggleTermsAndCondition();
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: controller.termsAndCondition.value
                                        ? AppColors.primaryColor
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: controller.termsAndCondition.value
                                          ? AppColors.primaryColor
                                          : AppColors.hintText,
                                    ),
                                  ),
                                  child: controller.termsAndCondition.value
                                      ? Icon(
                                          Icons.check,
                                          size: 12,
                                          color: Colors.white,
                                        )
                                      : null,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'Yes, I understand and agree to the ',
                                      style: GoogleFonts.inter(
                                        color: AppColors.textGrey,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Terms of Service',
                                      style: GoogleFonts.inter(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.toNamed(
                                            AppRoutes.termsAndCondition,
                                          );
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        //End of terms and condition
                        SizedBox(height: 24),
                        CustomSubmitButton(text: "Sign Up", onTap: () {}),
                        SizedBox(height: 24),
                        OrSignUnWith(text: "Or Sign up with"),
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
