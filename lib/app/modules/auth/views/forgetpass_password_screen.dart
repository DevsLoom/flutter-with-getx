import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../utils/widget_keys.dart';
import '../../../components/custom_text_field.dart';
import '../../../components/primary_button.dart';
import '../controllers/forgetpass_password_controller.dart';

class ForgetpassPasswordScreen extends GetView<ForgetpassPasswordController> {
  const ForgetpassPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Set Password'), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.0),
            Text('Set New Password', style: Get.textTheme.titleLarge),
            Text(
              'Enter your new password to continue',
              style: Get.textTheme.bodyMedium,
            ),
            SizedBox(height: 24.0),
            Obx(
              () => CustomTextField(
                key: WidgetKeys.forgetPassNewPasswordField,
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
                key: WidgetKeys.forgetPassConfirmPasswordField,
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
            93.verticalSpace,
            PrimaryButton(
              key: WidgetKeys.forgetpassConfirmButton,
              onPressed: null, //() => controller.setNewPassword(),
              text: 'Confirm',
            ),
          ],
        ),
      ),
    );
  }
}
