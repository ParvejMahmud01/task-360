import 'dart:async';
import 'package:get/get.dart';

class OtpController extends GetxController {
  var remainingTime = 300.obs;
  var otp = ''.obs;
  Timer? _timer;

  @override
  void onInit() {
    startTimer();

    super.onInit();
  }

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
