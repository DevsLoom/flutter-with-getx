import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/api_paths.dart';
import '../../../components/custom_loading_overlay.dart';
import '../../../routes/app_pages.dart';
import '../../../services/base_client.dart';
import '../../../services/device_id_service.dart';
import '../../../services/page_navigation.dart';
import '../../../services/validator_service.dart';

class RegistrationController extends GetxController {
  /// Define any necessary variables or services here
  ///
  late final GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();
  late final GlobalKey<FormState> registrationPassFormKey =
      GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController cPassController = TextEditingController();
  final RxBool isPasswordVisible = false.obs;

  @override
  void onInit() {
    //
    super.onInit();
    // Initialize any necessary data or services here
  }

  @override
  void onReady() {
    //
    super.onReady();
    // Perform actions when the controller is ready, like navigating to another page
  }

  @override
  void onClose() {
    // Clean up resources if needed
    super.onClose();
  }

  /// Method to toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  //
  void registerRequest() async {
    if (ValidatorService.validateAndSave(registrationPassFormKey)) {
      showLoadingOverLay(
        asyncFunction: () async {
          BaseClient.safeApiCall(
            ApiPaths.register,
            RequestType.post,
            data: {
              "first_name": firstNameController.text,
              //"middle_name": "string",
              "last_name": lastNameController.text,
              "email": emailController.text,
              // "phone": "string",
              "password": newPassController.text,
              "confirm_password": cPassController.text,

              // "avatar": "string",
              // "signature": "string",
              'device_type': GetPlatform.isWeb
                  ? 'WEB'
                  : GetPlatform.isAndroid
                  ? 'ANDROID'
                  : GetPlatform.isIOS
                  ? 'IOS'
                  : 'OTHER',
              'device_id':
                  await DeviceDetails.deviceId(), // Replace with actual device ID logic
              'device_name': await DeviceDetails.deviceName(),
            },
            onSuccess: (response) {
              // Handle successful login response
              // For example, you might want to save the token or navigate to another screen
              /// Get.snackbar('Login Successful', 'Welcome back!')
              ///
              //check need_verify exist or not

              PageNavigationService.generalNavigation(
                Routes.registerOtpScreen,
                arguments: {'email': emailController.text},
              );

              // Navigate to the home screen or dashboard
              // Get.offAllNamed(Routes.home);
            },
            onError: (error) {
              // Handle error response
              Get.snackbar('Login Failed', error.toString());
            },
          );
        },
        msg: 'Logging in...',
      );
    }
  }
}
