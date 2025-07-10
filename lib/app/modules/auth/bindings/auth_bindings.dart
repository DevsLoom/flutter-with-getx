import 'package:get/get.dart';
import '../controllers/forgetpass_email_controller.dart';
import '../controllers/forgetpass_otp_controller.dart';
import '../controllers/forgetpass_password_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/login_otp_controller.dart';
import '../controllers/register_otp_controller.dart';
import '../controllers/registration_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}

class LoginOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginOtpController>(() => LoginOtpController());
  }
}

class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrationController>(() => RegistrationController());
  }
}

class RegisterOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterOtpController>(() => RegisterOtpController());
  }
}

/// Forget Password
class ForgetpassEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetpassEmailController>(() => ForgetpassEmailController());
  }
}

class ForgetpassOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetpassOtpController>(() => ForgetpassOtpController());
  }
}

class ForgetpassPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetpassPasswordController>(
      () => ForgetpassPasswordController(),
    );
  }
}
