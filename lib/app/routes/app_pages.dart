import 'package:get/get.dart';

import '../modules/auth/bindings/auth_bindings.dart';
import '../modules/auth/views/forgetpass_email_screen.dart';
import '../modules/auth/views/forgetpass_otp_screen.dart';
import '../modules/auth/views/forgetpass_password_screen.dart';
import '../modules/auth/views/login_otp_screen.dart';
import '../modules/auth/views/login_screen.dart';
import '../modules/auth/views/register_otp_screen.dart';
import '../modules/auth/views/registration_password_screen.dart';
import '../modules/auth/views/registration_screen.dart';
import '../modules/dashboard/bindings/dashboard_bindings.dart';
import '../modules/dashboard/views/dashboard_screen.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_list_screen.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_screen.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const iNITIAL = Routes.splashScreen;

  static final routes = [
    GetPage(
      name: _Paths.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.onBoardingScreen,
      page: () => const OnBoardingScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.loginScreen,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.loginOtpScreen,
      page: () => const LoginOtpScreen(),
      binding: LoginOtpBinding(),
    ),
    GetPage(
      name: _Paths.registrationScreen,
      page: () => const RegistrationScreen(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.registrationPasswordScreen,
      page: () => const RegistrationPasswordScreen(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.registerOtpScreen,
      page: () => const RegisterOtpScreen(),
      binding: RegisterOtpBinding(),
    ),

    ///<======================================== Forget Password
    GetPage(
      name: _Paths.forgetPassEmailScreen,
      page: () => const ForgetPassEmailScreen(),
      binding: ForgetpassEmailBinding(),
    ),
    GetPage(
      name: _Paths.forgetPassOtpScreen,
      page: () => const ForgetPassOtpScreen(),
      binding: ForgetpassOtpBinding(),
    ),
    GetPage(
      name: _Paths.forgetpassPasswordScreen,
      page: () => const ForgetpassPasswordScreen(),
      binding: ForgetpassPasswordBinding(),
    ),

    ///<============================================= Dashboard
    GetPage(
      name: _Paths.dashboard,
      page: () => const DashboardScreen(),
      binding: DashBoardBinding(),
    ),

    ///<============================================= Notification
    GetPage(
      name: _Paths.notificationListScreen,
      page: () => const NotificationListScreen(),
      binding: NotificationScreenBinding(),
    ),
  ];
}
