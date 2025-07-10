import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetpassPasswordController extends GetxController {
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController cPassController = TextEditingController();
  final RxBool isPasswordVisible = false.obs;

  /// Method to toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
