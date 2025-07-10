import 'package:get/get.dart';

import '../../../data/local/my_shared_pref.dart';
import '../../../routes/app_pages.dart';
import '../../../services/page_navigation.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    //
    super.onInit();
    splashDelay();
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

  Future<void> splashDelay() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!MySharedPref.isOnboardingComplete()) {
      PageNavigationService.removeAllAndNavigate(Routes.onBoarding);
    } else {
      PageNavigationService.removeAllAndNavigate(Routes.login);
    }
  }
}
