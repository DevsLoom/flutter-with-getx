import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/theme/dark_theme_colors.dart';
import '../../../../config/theme/light_theme_colors.dart';
import '../../../../gen/assets.gen.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../home/views/home_views.dart';
import '../controllers/dashboard_controller.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLightTheme = MySharedPref.isLightTheme();
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: TabBarView(
        controller: controller.dashboardTabController,
        // physics: const NeverScrollableScrollPhysics(),
        children: [
          // Home Tab
          HomeViews(),
          // Statement Tab
          Center(child: Text('Statement Tab')),
          // Portfolio Tab
          Center(child: Text('Portfolio Tab')),
          // Settings Tab
          Center(child: Text('Settings Tab')),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        color: isLightTheme
            ? LightThemeColors.backgroundColor
            : DarkThemeColors.backgroundColor,
        elevation: 10.0,
        notchMargin: 5.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 14.5.h),
        shape: CircularNotchedRectangle(),
        child: Obx(
          () => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: () => controller.changeDashboardTabbar(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.images.homeSelected.image(
                          fit: BoxFit.contain,
                          width: 22.w,
                          height: 22.h,
                          color: controller.currentDashboardIndex.value == 0
                              ? null
                              : (isLightTheme
                                    ? LightThemeColors.iconColor2
                                    : DarkThemeColors.iconColor2),
                        ),
                        Text(
                          'Home',
                          style: theme.textTheme.labelMedium?.copyWith(
                            fontWeight:
                                controller.currentDashboardIndex.value == 0
                                ? FontWeight.w600
                                : FontWeight.w400,
                            color: controller.currentDashboardIndex.value == 0
                                ? null
                                : (isLightTheme
                                      ? LightThemeColors.iconColor2
                                      : DarkThemeColors.iconColor2),
                            height: 1.6,
                            letterSpacing: -0.16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  15.horizontalSpace,
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: () => controller.changeDashboardTabbar(1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.images.chartSelected.image(
                          fit: BoxFit.contain,
                          width: 22.w,
                          height: 22.h,
                          color: controller.currentDashboardIndex.value == 1
                              ? null
                              : (isLightTheme
                                    ? LightThemeColors.iconColor2
                                    : DarkThemeColors.iconColor2),
                        ),
                        Text(
                          'Statement',
                          style: theme.textTheme.labelMedium?.copyWith(
                            fontWeight:
                                controller.currentDashboardIndex.value == 1
                                ? FontWeight.w600
                                : FontWeight.w400,
                            color: controller.currentDashboardIndex.value == 1
                                ? null
                                : (isLightTheme
                                      ? LightThemeColors.iconColor2
                                      : DarkThemeColors.iconColor2),
                            height: 1.6,
                            letterSpacing: -0.16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: () => controller.changeDashboardTabbar(2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.images.cardSelected.image(
                          fit: BoxFit.contain,
                          width: 22.w,
                          height: 22.h,
                          color: controller.currentDashboardIndex.value == 2
                              ? null
                              : (isLightTheme
                                    ? LightThemeColors.iconColor2
                                    : DarkThemeColors.iconColor2),
                        ),
                        Text(
                          'Portfolio',
                          style: theme.textTheme.labelMedium?.copyWith(
                            fontWeight:
                                controller.currentDashboardIndex.value == 2
                                ? FontWeight.w600
                                : FontWeight.w400,
                            color: controller.currentDashboardIndex.value == 2
                                ? null
                                : (isLightTheme
                                      ? LightThemeColors.iconColor2
                                      : DarkThemeColors.iconColor2),
                            height: 1.6,
                            letterSpacing: -0.16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  15.horizontalSpace,
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: () => controller.changeDashboardTabbar(3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.images.homeSelected.image(
                          fit: BoxFit.contain,
                          width: 22.w,
                          height: 22.h,
                          color: controller.currentDashboardIndex.value == 3
                              ? null
                              : (isLightTheme
                                    ? LightThemeColors.iconColor2
                                    : DarkThemeColors.iconColor2),
                        ),
                        Text(
                          'Settings',
                          style: theme.textTheme.labelMedium?.copyWith(
                            fontWeight:
                                controller.currentDashboardIndex.value == 3
                                ? FontWeight.w600
                                : FontWeight.w400,
                            color: controller.currentDashboardIndex.value == 3
                                ? null
                                : (isLightTheme
                                      ? LightThemeColors.iconColor2
                                      : DarkThemeColors.iconColor2),
                            height: 1.6,
                            letterSpacing: -0.16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),

          // TabBar(
          //   controller: controller.dashboardTabController,
          //   automaticIndicatorColorAdjustment: true,
          //   indicator: const BoxDecoration(),

          //   labelColor: isLightTheme
          //       ? LightThemeColors.titleTextColor
          //       : DarkThemeColors.titleTextColor,
          //   unselectedLabelColor: isLightTheme
          //       ? LightThemeColors.iconColor2
          //       : DarkThemeColors.iconColor2,
          //   onTap: (value) => controller.changeDashboardTabbar(value),
          //   tabs: [
          //     Tab(
          //       icon: Assets.images.homeSelected.image(
          //         fit: BoxFit.contain,
          //         width: 22.w,
          //         height: 22.h,
          //         color: controller.currentDashboardIndex.value == 0
          //             ? null
          //             : (isLightTheme
          //                   ? LightThemeColors.iconColor2
          //                   : DarkThemeColors.iconColor2),
          //       ),
          //       text: 'Home',
          //     ),
          //     Tab(
          //       icon: Assets.images.chartSelected.image(
          //         fit: BoxFit.contain,
          //         width: 22.w,
          //         height: 22.h,
          //         color: controller.currentDashboardIndex.value == 1
          //             ? null
          //             : (isLightTheme
          //                   ? LightThemeColors.iconColor2
          //                   : DarkThemeColors.iconColor2),
          //       ),
          //       text: 'Statement',
          //     ),
          //     Tab(
          //       icon: Assets.images.cardSelected.image(
          //         fit: BoxFit.contain,
          //         width: 22.w,
          //         height: 22.h,
          //         color: controller.currentDashboardIndex.value == 2
          //             ? null
          //             : (isLightTheme
          //                   ? LightThemeColors.iconColor2
          //                   : DarkThemeColors.iconColor2),
          //       ),
          //       text: 'Portfolio',
          //     ),
          //     Tab(
          //       icon: Assets.images.homeSelected.image(
          //         fit: BoxFit.contain,
          //         width: 22.w,
          //         height: 22.h,
          //         color: controller.currentDashboardIndex.value == 3
          //             ? null
          //             : (isLightTheme
          //                   ? LightThemeColors.iconColor2
          //                   : DarkThemeColors.iconColor2),
          //       ),
          //       text: 'Settings',
          //     ),
          //   ],
          // ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle floating action button press
          Get.snackbar('Action', 'Floating Action Button Pressed');
        },
        shape: const CircleBorder(),
        backgroundColor: isLightTheme
            ? LightThemeColors.primaryColor
            : DarkThemeColors.primaryColor,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
