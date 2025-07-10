import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/dark_theme_colors.dart';
import '../../../../../config/theme/light_theme_colors.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../data/local/my_shared_pref.dart';

class TransactionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;
  final String
  tnxType; // tnxType e.g., "add_money", "move_money" ,"withdrawn_Money"
  const TransactionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.tnxType,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLightTheme = MySharedPref.isLightTheme();
    final ThemeData theme = Theme.of(context);
    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 0),
      color: isLightTheme
          ? LightThemeColors.cardBackgroundColor
          : DarkThemeColors.cardBackgroundColor,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 0.0.h),

        child: ListTile(
          contentPadding: EdgeInsets.zero,
          minVerticalPadding: 0,
          leading: CircleAvatar(
            radius: 24.r,
            backgroundColor: isLightTheme
                ? LightThemeColors.accentColor
                : DarkThemeColors.accentColor,
            child: tnxType == 'add_money'
                ? Assets.images.moneyRecive.image(
                    width: 24.w,
                    height: 24.h,
                    fit: BoxFit.cover,
                  )
                : tnxType == 'move_money'
                ? Assets.images.moneyChange.image(
                    width: 24.w,
                    height: 24.h,
                    fit: BoxFit.cover,
                  )
                : tnxType == 'withdrawn_Money'
                ? Assets.images.moneySend.image(
                    width: 24.w,
                    height: 24.h,
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          title: Text(
            title,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: isLightTheme
                  ? LightThemeColors.subtitleTextColor
                  : DarkThemeColors.subtitleTextColor,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.48.sp,
              color: isLightTheme
                  ? LightThemeColors.titleTextColor
                  : DarkThemeColors.titleTextColor,
            ),
          ),
          trailing: Text(
            '-\$$amount',
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.48.sp,
              color: isLightTheme
                  ? LightThemeColors.titleTextColor
                  : DarkThemeColors.titleTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
