import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../utils/widget_keys.dart';
import '../../../components/custom_text_field.dart';
import '../../../components/primary_button.dart';
import '../../../routes/app_pages.dart';
import '../../../services/page_navigation.dart';
import '../controllers/forgetpass_email_controller.dart';

class ForgetPassEmailScreen extends GetView<ForgetpassEmailController> {
  const ForgetPassEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password'), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            8.verticalSpace,
            Text('Forgot Password', style: Get.textTheme.titleLarge),
            Text(
              'Enter your email account to reset your password',
              style: Get.textTheme.bodyMedium,
            ),
            24.verticalSpace,
            CustomTextField(
              key: WidgetKeys.forgetPasswordEmailField,
              controller: controller.emailController,
              labelText: 'Your Email',
              hintText: 'exTHFA',
              prefixIcon: Assets.images.sms.keyName,
            ),
            155.verticalSpace,
            PrimaryButton(
              key: WidgetKeys.forgetPassNextButton,
              text: 'Next',
              onPressed: () => PageNavigationService.generalNavigation(
                Routes.forgetPassOtpScreen,
                arguments: controller.emailController.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
