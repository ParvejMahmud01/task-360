import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:task_360/core/const/app_colors.dart';
import 'package:task_360/core/global_widegts/custom_appbar.dart';
import 'package:task_360/core/global_widegts/custom_submit_button.dart';
import 'package:task_360/core/global_widegts/custom_text.dart';
import 'package:task_360/core/route/routes.dart';
import 'package:task_360/feature/auth/forgot_password/controller/forgot_controller.dart';

class ResetTypeScreen extends StatelessWidget {
  ResetTypeScreen({super.key});
  final ForgotController controller = Get.put(ForgotController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomAppBar(text: "Choose Reset Type?"),
            SizedBox(height: 36),

            // Email Option
            Obx(
              () => GestureDetector(
                onTap: controller.toggleEmail,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  height: 76,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffF9F9FB),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: controller.isEmail.value
                          ? AppColors.primaryColor
                          : Colors.transparent,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.email, size: 24),
                      SizedBox(width: 24),
                      CustomText(
                        text: "Via Email",
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGrey,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 14),

            // Phone Option
            Obx(
              () => GestureDetector(
                onTap: controller.togglePhone,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  height: 76,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffF9F9FB),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: controller.isPhone.value
                          ? AppColors.primaryColor
                          : Colors.transparent,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.phone_android, size: 24),
                      SizedBox(width: 24),
                      CustomText(
                        text: "Via SMS",
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGrey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            CustomSubmitButton(
              text: "Next",
              onTap: () {
                if (controller.isEmail.value || controller.isPhone.value) {
                  Get.toNamed(
                    AppRoutes.forgotPassword,
                    arguments: {"title": controller.selectedType},
                  );
                } else {
                  EasyLoading.showError("Please Select Reset Type");
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
