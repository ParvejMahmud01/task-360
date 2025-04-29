import 'package:get/get.dart';

import '../../../core/route/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToLogin();
  }

  void _navigateToLogin() async {
    await Future.delayed(Duration(seconds: 2));
    Get.offNamed(AppRoutes.onboarding);
  }
}
