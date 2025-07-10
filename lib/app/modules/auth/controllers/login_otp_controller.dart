import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/api_paths.dart';
import '../../../components/custom_loading_overlay.dart';
import '../../../routes/app_pages.dart';
import '../../../services/base_client.dart';
import '../../../services/page_navigation.dart';

class LoginOtpController extends GetxController {
  late TextEditingController otpController = TextEditingController();
  final RxInt otpTimer = 0.obs; // Observable to track the OTP timer
  Timer? _timer;

  // Fetch data from Arguments
  late final String email;
  // late final String phone;
  late final String title;
  late final String subtitle;
  late final String trackId;

  @override
  void onInit() {
    // Assign arguments after Get.arguments is available
    final args = Get.arguments ?? {};
    email = args['email'] ?? '';
    // phone = args['phone'] ?? '';
    title = args['title'] ?? '';
    subtitle = args['subtitle'] ?? '';
    trackId = args['track_id'] ?? '';

    super.onInit();
    startOtpTimer(); // Start the OTP timer when the controller is initialized.
  }

  @override
  void onClose() {
    cancelTimer(); // Cancel the timer when the controller is closed.

    super.onClose();
  }

  void startOtpTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel(); // Cancel the previous timer if active.
    }

    otpTimer.value = 60; // Set the initial timer value to 60 seconds.

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (otpTimer.value > 0) {
        otpTimer.value--; // Decrement the timer value.
        //   print(otpTimer.value);
      } else {
        _timer!.cancel(); // Cancel the timer when it reaches 0.
      }
      update();
    });
  }

  void cancelTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel(); // Cancel the timer when the controller is closed.
    }
  }

  // Resend OTP logic can be added here
  void resendOtp() async {
    await showLoadingOverLay(
      asyncFunction: () async {
        BaseClient.safeApiCall(
          ApiPaths.loginResend,
          RequestType.post,
          data: {"email": email, "track_id": trackId},
          onSuccess: (response) {
            //check need_verify exist or not

            // Navigate to the home screen or dashboard
            // Get.offAllNamed(Routes.home);
            Get.snackbar('OTP Sent', 'Please check your email for the OTP.');
            startOtpTimer(); // Restart the OTP timer after resending.
          },
          onError: (error) {
            // Handle error response
            Get.snackbar('OTP Retry Failed', error.toString());
          },
        );
      },
      msg: 'Sending OTP...',
    );
  }

  // Verify OTP
  void verifyOtp() async {
    await showLoadingOverLay(
      asyncFunction: () async {
        BaseClient.safeApiCall(
          ApiPaths.loginVerify,
          RequestType.post,
          data: {
            "email": email,
            "code": otpController.text,
            "track_id": trackId,
          },
          onSuccess: (response) {
            //check need_verify exist or not
            PageNavigationService.removeAllAndNavigate(Routes.dashboard);
            //Get.snackbar('OTP Verified', 'Login successful!');
            // Navigate to the home screen or dashboard
            // Get.offAllNamed(Routes.home);
          },
          onError: (error) {
            // Handle error response
            Get.snackbar('OTP Verification Failed', error.toString());
          },
        );
      },
      msg: 'Verifing OTP...',
    );
  }
}
