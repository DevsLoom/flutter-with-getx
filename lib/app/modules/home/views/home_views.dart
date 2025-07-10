import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterwithgetx/config/theme/dark_theme_colors.dart';
import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../gen/assets.gen.dart';
import '../../../components/flip_card.dart';
import '../../../data/local/my_shared_pref.dart';
import '../controllers/home_controller.dart';
import 'widgets/balance_widget.dart';
import 'widgets/account_home_card_widget.dart';
import 'widgets/transaction_card.dart';

class HomeViews extends GetView<HomeViewController> {
  const HomeViews({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLightTheme = MySharedPref.isLightTheme();
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: FlipCard(
          duration: Duration(milliseconds: 700),
          flipOnTouch: true,
          autoFlip: true,
          infinityFlip: true,
          flipDelay: Duration(seconds: 5),
          builder: (context, isFront) {
            return isFront
                ? Assets.images.logo.image(
                    fit: BoxFit.contain,
                    width: 90.w,
                    height: 49.h,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello,  Ali Husni'),
                      Text('Welcome back to Stock!'),
                    ],
                  );
          },
        ),

        actions: [
          Container(
            margin: EdgeInsets.only(right: 16.0.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isLightTheme
                    ? LightThemeColors.borderColor
                    : DarkThemeColors.borderColor,
                width: 1.0.r,
              ),
            ),
            padding: EdgeInsets.all(12.0.r),
            child: Assets.images.notification.image(
              fit: BoxFit.contain,
              width: 24.w,
              height: 24.h,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
        child: Column(
          children: [
            ///<========================= Balance Card =========================>
            BalanceWidget(),

            ///<========================= Verification Status Card =========================>
            Card(
              color: isLightTheme
                  ? LightThemeColors.cardBackgroundColor
                  : DarkThemeColors.cardBackgroundColor,
              child: Padding(
                padding: EdgeInsets.all(16.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Chip(
                      label: Text(
                        'Under Review',
                        // style: theme.textTheme.labelSmall,
                      ),
                      backgroundColor: Colors.yellow.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    16.verticalSpace,
                    Text(
                      'Verification is Pending',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontSize: 24.sp,
                        letterSpacing: -0.48.sp,
                      ),
                    ),
                    8.verticalSpace,
                    Text(
                      'Your account is under review. We will notify you once it is approved.',
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            17.verticalSpace,
            Card(
              color: isLightTheme
                  ? LightThemeColors.cardBackgroundColor
                  : DarkThemeColors.cardBackgroundColor,
              child: Padding(
                padding: EdgeInsets.all(16.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Chip(
                      label: Text(
                        'New',
                        // style: theme.textTheme.labelSmall,
                      ),
                      backgroundColor: Colors.yellow.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    16.verticalSpace,
                    Text(
                      'Earn cash instantly',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontSize: 18.sp,
                        letterSpacing: -0.48.sp,
                      ),
                    ),
                    8.verticalSpace,
                    Text(
                      'Take surveys and get cash in your Checking account.',
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            24.verticalSpace,
            Row(
              children: [
                ///<========================= Add Money Button =========================>
                Card(
                  elevation: 0,
                  margin: EdgeInsets.only(right: 7.5.w),
                  color: isLightTheme
                      ? LightThemeColors.cardBackgroundColor
                      : DarkThemeColors.cardBackgroundColor,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0.w,
                      vertical: 16.0.h,
                    ),
                    width: 173.w,
                    height: 96.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Assets.images.moneyRecive.image(
                          width: 24.w,
                          height: 24.h,

                          fit: BoxFit.cover,
                        ),
                        16.verticalSpace,
                        Text(
                          'Add Money',
                          style: theme.textTheme.labelLarge?.copyWith(
                            fontSize: 16.sp,
                            letterSpacing: -0.48.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                ///<========================= Move Money Button =========================>
                Card(
                  elevation: 0,
                  margin: EdgeInsets.only(left: 7.5.w),
                  color: isLightTheme
                      ? LightThemeColors.cardBackgroundColor
                      : DarkThemeColors.cardBackgroundColor,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0.w,
                      vertical: 16.0.h,
                    ),
                    width: 173.w,
                    height: 96.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Assets.images.moneyChange.image(
                          width: 24.w,
                          height: 24.h,

                          fit: BoxFit.cover,
                        ),
                        16.verticalSpace,
                        Text(
                          'Move Money',
                          style: theme.textTheme.labelLarge?.copyWith(
                            fontSize: 16.sp,
                            letterSpacing: -0.48.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            24.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Saving Plans',
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontSize: 18.sp,
                    letterSpacing: -0.48.sp,
                  ),
                ),
                Assets.images.arrowRight.image(
                  width: 24.w,
                  height: 24.h,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            16.verticalSpace,

            ///<========================= Add New Plan Button =========================>
            Card(
              elevation: 0,
              margin: EdgeInsets.zero,
              color: isLightTheme
                  ? LightThemeColors.cardBackgroundColor
                  : DarkThemeColors.cardBackgroundColor,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0.w,
                  vertical: 16.0.h,
                ),
                width: 361.w,
                height: 56.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.images.cardAdd.image(
                      width: 24.w,
                      height: 24.h,

                      fit: BoxFit.cover,
                    ),
                    8.horizontalSpace,
                    Text(
                      'Add New Plan',
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontSize: 16.sp,
                        letterSpacing: -0.48.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AccountHomeCardWidget(),
            24.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Transactions',
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontSize: 18.sp,
                    letterSpacing: -0.48.sp,
                  ),
                ),
                Assets.images.arrowRight.image(
                  width: 24.w,
                  height: 24.h,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            16.verticalSpace,
            TransactionCard(
              title: 'Add Money',
              subtitle: 'TFSA',
              amount: '100.00',
              tnxType: 'add_money',
            ),
            TransactionCard(
              title: 'Move Money',
              subtitle: 'TFSA',
              amount: '50.00',
              tnxType: 'move_money',
            ),
            TransactionCard(
              title: 'Withdrawn Money',
              subtitle: 'TFSA',
              amount: '200.00',
              tnxType: 'withdrawn_Money',
            ),
            TransactionCard(
              title: 'Move Money',
              subtitle: 'TFSA',
              amount: '150.00',
              tnxType: 'move_money',
            ),
          ],
        ),
      ),
    );
  }
}
