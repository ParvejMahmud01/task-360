import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var numberController = TextEditingController();
  var passwordController = TextEditingController();
  var isPasswordHidden = false.obs;
  RxBool obscureText = true.obs;

  var hasMinLength = false.obs;
  var hasNumber = false.obs;
  var hasSymbol = false.obs;
  var passwordStrength = 0.0.obs;
  var termsAndCondition = false.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleTermsAndCondition() {
    termsAndCondition.value = !termsAndCondition.value;
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
