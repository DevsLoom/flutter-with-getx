import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/dark_theme_colors.dart';
import '../../../../../config/theme/light_theme_colors.dart';
import '../../../../data/local/my_shared_pref.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLightTheme = MySharedPref.isLightTheme();
    final ThemeData theme = Theme.of(context);
    return Stack(
      children: [
        SizedBox(height: 260.h, width: 361.w),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 327.w,
            height: 81.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              color: isLightTheme
                  ? LightThemeColors.primaryColor
                  : DarkThemeColors.primaryColor,
            ),
          ),
        ),
        Positioned(
          top: 13.h,
          left: 0.w,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.r),
            ),
            color: isLightTheme
                ? LightThemeColors.cardBackgroundColor2
                : DarkThemeColors.cardBackgroundColor2,
            child: Container(
              width: 358.w,
              height: 239.h,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Available Balance',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: 14.sp,
                      letterSpacing: -0.48.sp,
                      fontWeight: FontWeight.w500,
                      color: isLightTheme
                          ? LightThemeColors.buttonTextColor.withValues(
                              alpha: 0.8,
                            )
                          : DarkThemeColors.buttonTextColor.withValues(
                              alpha: 0.8,
                            ),
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    '\$1,234.56',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: 36.sp,
                      letterSpacing: -1.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Divider(
                    height: 40.h,
                    color: isLightTheme
                        ? LightThemeColors.backgroundColor.withValues(
                            alpha: 0.16,
                          )
                        : DarkThemeColors.backgroundColor.withValues(
                            alpha: 0.16,
                          ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Investment',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 14.sp,
                          letterSpacing: -0.48.sp,
                          fontWeight: FontWeight.w500,
                          color: isLightTheme
                              ? LightThemeColors.buttonTextColor.withValues(
                                  alpha: 0.8,
                                )
                              : DarkThemeColors.buttonTextColor.withValues(
                                  alpha: 0.8,
                                ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: ' >',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: isLightTheme
                                    ? LightThemeColors.successColor
                                    : DarkThemeColors.successColor,
                              ),
                            ),
                            TextSpan(
                              text: '3.2% ',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: isLightTheme
                                    ? LightThemeColors.successColor
                                    : DarkThemeColors.successColor,
                              ),
                            ),
                            TextSpan(
                              text: 'last month',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontSize: 14.sp,
                                letterSpacing: -0.48.sp,
                                fontWeight: FontWeight.w500,
                                color: isLightTheme
                                    ? LightThemeColors.buttonTextColor
                                          .withValues(alpha: 0.8)
                                    : DarkThemeColors.buttonTextColor
                                          .withValues(alpha: 0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$6,234.00',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 24.sp,
                          letterSpacing: -0.48.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 38.h,
                        width: 118.w,
                        child: LineChart(
                          LineChartData(
                            gridData: FlGridData(show: false),
                            titlesData: FlTitlesData(show: false),
                            borderData: FlBorderData(show: false),

                            lineBarsData: [
                              LineChartBarData(
                                isCurved: true,
                                color: isLightTheme
                                    ? LightThemeColors.successColor
                                    : DarkThemeColors.successColor,
                                barWidth: 2,
                                dotData: FlDotData(show: false),
                                belowBarData: BarAreaData(show: false),
                                spots: const [
                                  FlSpot(0, 1),
                                  FlSpot(1, 1.5),
                                  FlSpot(2, 1.2),
                                  FlSpot(3, 1.7),
                                  FlSpot(4, 1.6),
                                  FlSpot(5, 2.0),
                                ],
                              ),
                            ],
                            minX: 0,
                            maxX: 5,
                            minY: 1,
                            maxY: 2.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
