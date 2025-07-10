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
import '../../../services/validator_service.dart';
import '../controllers/registration_controller.dart';

class RegistrationScreen extends GetView<RegistrationController> {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.h),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
        child: Form(
          key: controller.registrationFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Assets.images.logo.image(
                fit: BoxFit.contain,
                width: 90.w,
                height: 49.h,
              ),
              16.verticalSpace,
              Text('Register', style: Get.textTheme.titleLarge),
              Text('Create your account', style: Get.textTheme.bodyMedium),
              24.verticalSpace,
              CustomTextField(
                key: WidgetKeys.firstName,
                controller: controller.firstNameController,
                labelText: 'First Name',
                hintText: 'John',
                prefixIcon: Assets.images.user.keyName,
                validator: ValidatorService.validateFullName,
              ),
              CustomTextField(
                key: WidgetKeys.lastName,
                controller: controller.lastNameController,
                labelText: 'Last Name',
                hintText: 'Doe',
                prefixIcon: Assets.images.user.keyName,
              ),
              CustomTextField(
                key: WidgetKeys.email,
                controller: controller.emailController,
                labelText: 'Your Email',
                hintText: 'exTHFA',
                prefixIcon: Assets.images.sms.keyName,
              ),

              128.verticalSpace,
              PrimaryButton(
                key: WidgetKeys.registerDetailsContinueButton,
                text: 'Continue',
                onPressed: () {
                  if (ValidatorService.validateAndSave(
                    controller.registrationFormKey,
                  )) {
                    PageNavigationService.generalNavigation(
                      Routes.registrationPassword,
                    );
                  }
                },
              ),
              168.verticalSpace,
              Center(
                child: HyperlinkedText([
                  'I have already an account? ',
                  (
                    'Login',
                    () => PageNavigationService.generalNavigation(Routes.login),
                    WidgetKeys.navigateLoginPageButton,
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
