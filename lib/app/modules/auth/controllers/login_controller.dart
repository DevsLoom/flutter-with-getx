import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/api_paths.dart';
import '../../../components/custom_loading_overlay.dart';
import '../../../routes/app_pages.dart';
import '../../../services/base_client.dart';
import '../../../services/device_id_service.dart';
import '../../../services/page_navigation.dart';
import '../../../services/validator_service.dart';

class LoginController extends GetxController {
  /// Define any necessary variables or services here
  late final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
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

  /// Method to handle login logic
  void login() async {
    if (ValidatorService.validateAndSave(loginFormKey)) {
      showLoadingOverLay(
        asyncFunction: () async {
          BaseClient.safeApiCall(
            ApiPaths.login,
            RequestType.post,
            data: {
              "type": "REGULAR",
              "field_type": "EMAIL",
              'field': emailController.text,
              'password': passController.text,
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
              debugPrint("Response is $response");
              if (response.data['data'] != null &&
                  response.data['data']['need_verify'] != null) {
                if (response.data['data']['need_verify']) {
                  // CustomSnackBar.showCustomErrorSnackBar(
                  //   title: 'Verification Required',
                  //   message: response.data['message'] ?? 'Please verify ',
                  // );
                  PageNavigationService.generalNavigation(
                    Routes.loginOtpScreen,
                    arguments: {
                      'email': emailController.text,
                      //'phone': response.data['data']['phone'] ?? '',
                      'title': 'OTP Verification',
                      'subtitle':
                          response.data['message'] ??
                          'Please verify your account.',
                      'track_id': response.data['data']['track_id'] ?? '',
                    },
                  );
                } else {
                  PageNavigationService.removeAllAndNavigate(Routes.dashboard);
                }
              }

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
