import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterOtpController extends GetxController {
  late TextEditingController otpController = TextEditingController();
  final RxInt otpTimer = 0.obs; // Observable to track the OTP timer
  Timer? _timer;

  @override
  void onInit() {
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
}
