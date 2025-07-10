import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController
    with GetTickerProviderStateMixin {
  TabController? dashboardTabController;
  RxInt initialDashboardIndex = 0.obs;
  RxInt currentDashboardIndex = 0.obs;
  @override
  onInit() {
    dashboardTabController = TabController(
      vsync: this,
      length: 4,
      initialIndex: initialDashboardIndex.value,
    );
    super.onInit();
  }

  //<==================== Change App Tabbar
  void changeDashboardTabbar(int index) {
    if (index != 3) {
      dashboardTabController!.index = index >= 0 && index < 4 ? index : 0;
      currentDashboardIndex.value = index >= 0 && index < 4 ? index : 0;
    } else {
      dashboardTabController!.index = currentDashboardIndex.value;

      // showGeneralDialog(
      //   context: Get.context!,
      //   barrierDismissible: true,
      //   transitionDuration: const Duration(milliseconds: 400),
      //   barrierLabel: MaterialLocalizations.of(Get.context!).dialogLabel,
      //   barrierColor: Colors.black.withValues(alpha: 0.5),
      //   pageBuilder: (BuildContext context, _, __) {
      //     return const CustomDrawer();
      //   },
      //   transitionBuilder: (context, animation, secondaryAnimation, child) {
      //     return CustomSlideTransition(animation: animation, child: child);
      //   },
      // );
    }
  }
}
