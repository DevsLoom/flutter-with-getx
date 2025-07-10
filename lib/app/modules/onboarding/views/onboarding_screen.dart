import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/theme/dark_theme_colors.dart';
import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../utils/widget_keys.dart';
import '../../../components/primary_button.dart';
import '../../../data/local/my_shared_pref.dart';
import '../controllers/onboarding_controller.dart';

class OnBoardingScreen extends GetView<OnboardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLight = MySharedPref.isLightTheme();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: InkWell(
              key: WidgetKeys.onboardingSkipButton,
              onTap: () => controller.getStarted(),
              child: Text(
                Strings.skip.tr,
                style: Get.theme.textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              fit: StackFit.passthrough,
              alignment: Alignment.center,
              children: [
                SizedBox(width: 230.w, height: 360.h),
                Positioned(
                  left: 0.w,
                  bottom: 0,
                  child: Assets.images.silver.image(
                    fit: BoxFit.contain,
                    width: 178.199.w,
                    height: 360.567.h,
                  ),
                ),
                Positioned(
                  left: 9.86.w,
                  bottom: 7.76.h,
                  child: Assets.images.mobileView.image(
                    fit: BoxFit.contain,
                    width: 159.754.w,
                    height: 345.665.h,
                  ),
                ),

                Positioned(
                  right: 0.w,
                  bottom: 0,
                  child: Assets.images.cardImage.image(
                    fit: BoxFit.cover,
                    width: 121.w,
                    height: 188.h,
                  ),
                ),
              ],
            ),
            67.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Text(
                    Strings.onBoardingTitle.tr,
                    textAlign: TextAlign.center,
                    style: Get.theme.textTheme.titleLarge,
                  ),
                  Text(
                    Strings.onBoardingSubTitle.tr,
                    textAlign: TextAlign.center,
                    style: Get.theme.textTheme.bodyMedium?.copyWith(
                      color: isLight
                          ? LightThemeColors.subtitleTextColor
                          : DarkThemeColors.subtitleTextColor,
                    ),
                  ),
                ],
              ),
            ),

            42.verticalSpace,
            PrimaryButton(
              key: WidgetKeys.onboardingGetStartedButton,
              text: Strings.getStarted.tr,
              onPressed: () => controller.getStarted(),
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
