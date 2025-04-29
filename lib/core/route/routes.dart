import 'package:get/get.dart';
import 'package:task_360/feature/auth/forgot_password/view/create_new_password_screen.dart';
import 'package:task_360/feature/auth/forgot_password/view/forgot_password_screen.dart';
import 'package:task_360/feature/auth/forgot_password/view/reset_type_screen.dart';
import 'package:task_360/feature/auth/forgot_password/view/verify_otp_screen.dart';
import 'package:task_360/feature/auth/login/view/login_screen.dart';
import 'package:task_360/feature/auth/registration/view/registration_screen.dart';
import 'package:task_360/feature/splash/splash.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String registration = '/registration';
  static const String login = '/login';
  static const String termsAndCondition = '/termsAndCondition';
  static const String resetType = '/resetType';
  static const String forgotPassword = '/forgotPassword';
  static const String verifyOtp = '/verifyOtp';
  static const String createNewPassword = '/createNewPassword';

  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
      transition: Transition.rightToLeft,
    ),

    GetPage(name: registration, page: () => RegistrationScreen()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: resetType, page: () => ResetTypeScreen()),
    GetPage(name: forgotPassword, page: () => ForgotPasswordScreen()),
    GetPage(name: verifyOtp, page: () => VerifyOtpScreen()),
    GetPage(name: createNewPassword, page: () => CreateNewPasswordScreen()),
  ];
}
