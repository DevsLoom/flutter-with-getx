import 'package:get/get.dart';

import '../../../data/local/my_shared_pref.dart';
import '../../../routes/app_pages.dart';
import '../../../services/page_navigation.dart';

class OnboardingController extends GetxController {
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

  getStarted() {
    // Logic to handle the start of the onboarding process
    // This could include navigating to the next screen or saving some state
    // For example:
    // MySharedPref.setOnboardingComplete(true);
    // PageNavigationService.navigateToNextScreen();
    MySharedPref.setOnboardingComplete(true);
    PageNavigationService.removeAllAndNavigate(Routes.login);
  }

  @override
  void onClose() {
    // Clean up resources if needed
    super.onClose();
  }
}
