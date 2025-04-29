import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ForgotController extends GetxController {
  var isEmail = false.obs;
  var isPhone = false.obs;
  var emailController = TextEditingController();
  var isIcon = false.obs;

  void toggleEmail() {
    isEmail.value = true;
    isPhone.value = false;
    isIcon.value = true;
  }

  void togglePhone() {
    isPhone.value = true;
    isEmail.value = false;
    isIcon.value = false;
  }

  String get selectedType =>
      isEmail.value
          ? "E-mail"
          : isPhone.value
          ? "Phone Number"
          : "";

  var otp = ''.obs;
  var remainingTime = 300.obs;
  Timer? _timer;
  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        _timer?.cancel();
      }
    });
  }

  void resetTimer() {
    _timer?.cancel();
    remainingTime.value = 300;
    startTimer();
  }

  void stopTimer() {
    _timer?.cancel();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
