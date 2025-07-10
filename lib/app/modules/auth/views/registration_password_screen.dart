import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../utils/widget_keys.dart';
import '../../../components/custom_text_field.dart';
import '../../../components/primary_button.dart';
import '../../../routes/app_pages.dart';
import '../../../services/page_navigation.dart';
import '../controllers/registration_controller.dart';

class RegistrationPasswordScreen extends GetView<RegistrationController> {
  const RegistrationPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Set Password'), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
        child: Form(
          key: controller.registrationPassFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              8.verticalSpace,
              Text('Set Password', style: Get.textTheme.titleLarge),
              Text('Create your new password', style: Get.textTheme.bodyMedium),
              24.verticalSpace,
              Obx(
                () => CustomTextField(
                  key: WidgetKeys.password,
                  controller: controller.newPassController,
                  labelText: 'New Password',
                  hintText: '*********',
                  prefixIcon: Assets.images.lock.keyName,
                  suffixIcon: controller.isPasswordVisible.value
                      ? Assets.images.eyeOpen.keyName
                      : Assets.images.eyeSlash.keyName,
                  suffixIconOnTap: () => controller.togglePasswordVisibility(),
                  obscureText: !controller.isPasswordVisible.value,
                ),
              ),
              Obx(
                () => CustomTextField(
                  key: WidgetKeys.confirmPassword,
                  controller: controller.cPassController,
                  labelText: 'Confirm Password',
                  hintText: '*********',
                  prefixIcon: Assets.images.lock.keyName,
                  suffixIcon: controller.isPasswordVisible.value
                      ? Assets.images.eyeOpen.keyName
                      : Assets.images.eyeSlash.keyName,
                  suffixIconOnTap: () => controller.togglePasswordVisibility(),
                  obscureText: !controller.isPasswordVisible.value,
                ),
              ),
              128.verticalSpace,
              PrimaryButton(
                key: WidgetKeys.registratioPasswordContinueButton,
                text: 'Continue',
                onPressed: () => PageNavigationService.generalNavigation(
                  Routes.registerOtpScreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
