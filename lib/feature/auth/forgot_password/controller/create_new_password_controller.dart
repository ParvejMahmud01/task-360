import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPasswordController extends GetxController {
  var newPasswordController = TextEditingController();

  var confirmPasswordController = TextEditingController();
  var isConfirmPassword = false.obs;
  var isNewPassword = false.obs;
  RxBool obscureText = true.obs;

  var hasMinLength = false.obs;
  var hasNumber = false.obs;
  var hasSymbol = false.obs;
  var passwordStrength = 0.0.obs;
  void toggleNewPassword() {
    isNewPassword.value = !isNewPassword.value;
  }

  void toggleConfrimPassword() {
    isConfirmPassword.value = !isConfirmPassword.value;
  }

  void checkPasswordStrength(String password) {
    hasMinLength.value = password.length >= 8;
    hasNumber.value = RegExp(r'[0-9]').hasMatch(password);
    hasSymbol.value = RegExp(
      r'[!@#\$&*~%^()_\-+=|<>?/{}.,;:\[\]]',
    ).hasMatch(password);

    int count = 0;
    if (hasMinLength.value) count++;
    if (hasNumber.value) count++;
    if (hasSymbol.value) count++;

    passwordStrength.value = count / 3;
  }
}
