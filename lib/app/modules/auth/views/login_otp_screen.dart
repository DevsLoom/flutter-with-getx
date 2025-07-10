import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/widget_keys.dart';
import '../../../components/primary_button.dart';
import '../../../components/reusable_pinput.dart';
import '../controllers/login_otp_controller.dart';

class LoginOtpScreen extends GetView<LoginOtpController> {
  const LoginOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('OTP Verification'), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            8.verticalSpace,
            Text(controller.title, style: theme.textTheme.titleLarge),
            Text(controller.subtitle, style: theme.textTheme.bodyMedium),
            24.verticalSpace,
            PinInputField(
              key: WidgetKeys.loginPinTextField,
              length: 6,
              controller: controller.otpController,
              onChanged: (pin) {
                //  controller.pinTxtEditingCtrl.text = pin;
              },
              onCompleted: (pin) {
                // controller.verifyRegistrationOtp(
                //   controller.pinTxtEditingCtrl.text,
                // );
              },
            ),
            24.verticalSpace,
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  controller.otpTimer.value > 0
                      ? Text(
                          'Send code reload in',
                          style: theme.textTheme.bodyMedium,
                        )
                      : Text(
                          'Didn\'t receive the code?',
                          style: theme.textTheme.bodyMedium,
                        ),
                  controller.otpTimer.value > 0
                      ? Text(
                          controller.otpTimer.value.toString(),
                          style: theme.textTheme.bodyMedium,
                        )
                      : InkWell(
                          key: WidgetKeys.registrationPinResendButton,
                          onTap: () {},
                          child: Text(
                            "Resend",
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                ],
              ),
            ),
            128.verticalSpace,
            PrimaryButton(
              key: WidgetKeys.loginPinVerifyButton,
              text: 'Verify',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
