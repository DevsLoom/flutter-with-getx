import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../utils/widget_keys.dart';
import '../../../components/custom_text_field.dart';
import '../../../components/hyperlinked_text.dart';
import '../../../components/primary_button.dart';
import '../../../routes/app_pages.dart';
import '../../../services/page_navigation.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.h),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
        child: Form(
          key: controller.loginFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Assets.images.logo.image(
                fit: BoxFit.contain,
                width: 90.w,
                height: 49.h,
              ),
              16.verticalSpace,
              Text('Sign in to your Account', style: Get.textTheme.titleLarge),
              Text('Sign in to your Account', style: Get.textTheme.bodyMedium),
              4.verticalSpace,
              CustomTextField(
                key: WidgetKeys.userEmailField,
                controller: controller.emailController,
                labelText: 'Email',
                hintText: 'exTHFA',
                prefixIcon: Assets.images.sms.keyName,
              ),
              Obx(
                () => CustomTextField(
                  key: WidgetKeys.userPasswordField,
                  controller: controller.passController,
                  labelText: 'Enter Your Password',
                  hintText: '*********',
                  prefixIcon: Assets.images.lock.keyName,
                  suffixIcon: controller.isPasswordVisible.value
                      ? Assets.images.eyeOpen.keyName
                      : Assets.images.eyeSlash.keyName,
                  suffixIconOnTap: () => controller.togglePasswordVisibility(),
                  obscureText: !controller.isPasswordVisible.value,
                ),
              ),
              4.verticalSpace,
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => PageNavigationService.generalNavigation(
                    Routes.forgetPassEmailScreen,
                  ),
                  child: Text(
                    'Forgot Password?',
                    style: Get.textTheme.bodyMedium,
                  ),
                ),
              ),
              48.verticalSpace,
              PrimaryButton(
                key: WidgetKeys.loginButton,
                text: 'Login',
                onPressed: controller.login,
              ),
              192.verticalSpace,
              Center(
                child: HyperlinkedText([
                  'Don\'t have an account? ',
                  (
                    'Register',
                    () {
                      // Handle navigation to terms of service
                      PageNavigationService.removeAndNavigate(
                        Routes.registration,
                      );
                    },
                    WidgetKeys.navigateRegistrationPageButton,
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
