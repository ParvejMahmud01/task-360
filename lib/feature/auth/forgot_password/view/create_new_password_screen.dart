import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_360/core/const/app_colors.dart';
import 'package:task_360/core/const/icons_path.dart';
import 'package:task_360/core/global_widegts/custom_appbar.dart';
import 'package:task_360/feature/auth/forgot_password/components/password_changed.dart';
import 'package:task_360/feature/auth/forgot_password/controller/create_new_password_controller.dart';
import 'package:task_360/feature/auth/registration/components/custom_methods.dart';
import 'package:task_360/core/global_widegts/custom_submit_button.dart';
import 'package:task_360/core/global_widegts/custom_text.dart';
import 'package:task_360/core/global_widegts/custom_textfield.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  CreateNewPasswordScreen({super.key});
  final CreateNewPasswordController controller = Get.put(
    CreateNewPasswordController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      CustomAppBar(text: "Create New Password"),
                      SizedBox(height: 44),
                      CustomText(
                        text: "Set your new password",
                        // "Your password must be different from \nprevious used password",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGrey,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24),
                      //textfiled section
                      SizedBox(
                        child: Column(
                          children: [
                            Obx(
                              () => CustomTextfield(
                                controller: controller.newPasswordController,
                                hintext: "Enter your new password",
                                title: "New Password",

                                obsecureText: controller.isNewPassword.value,
                                suffixIcon: InkWell(
                                  onTap: controller.toggleNewPassword,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Image.asset(
                                      controller.isNewPassword.value
                                          ? IconsPath.visibility
                                          : IconsPath.visibilityOff,
                                    ),
                                  ),
                                ),

                                onChanged: controller.checkPasswordStrength,
                              ),
                            ),
                            SizedBox(height: 16),

                            Obx(
                              () => CustomTextfield(
                                controller:
                                    controller.confirmPasswordController,
                                hintext: "Enter your confirm password",
                                title: "Confirm Password",

                                obsecureText:
                                    controller.isConfirmPassword.value,
                                suffixIcon: InkWell(
                                  onTap: controller.toggleConfrimPassword,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Image.asset(
                                      controller.isConfirmPassword.value
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

                      Spacer(),
                      CustomSubmitButton(
                        text: "Reset Password",
                        onTap: () {
                          showPassword();
                        },
                      ),

                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
