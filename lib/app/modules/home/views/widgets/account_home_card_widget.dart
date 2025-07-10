import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/dark_theme_colors.dart';
import '../../../../../config/theme/light_theme_colors.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../data/local/my_shared_pref.dart';

class AccountHomeCardWidget extends StatefulWidget {
  const AccountHomeCardWidget({super.key});

  @override
  State<AccountHomeCardWidget> createState() => _AccountHomeCardWidgetState();
}

class _AccountHomeCardWidgetState extends State<AccountHomeCardWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final bool isLightTheme = MySharedPref.isLightTheme();
    final ThemeData theme = Theme.of(context);

    return Card(
      elevation: 0,
      margin: EdgeInsets.symmetric(vertical: 7.5.h, horizontal: 0),
      color: isLightTheme
          ? LightThemeColors.cardBackgroundColor
          : DarkThemeColors.cardBackgroundColor,
      child: ExpansionTile(
        title: Text(
          'TFSA',
          style: theme.textTheme.labelLarge?.copyWith(
            fontSize: 18.sp,
            letterSpacing: -0.48.sp,
          ),
        ),
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        collapsedShape: const RoundedRectangleBorder(side: BorderSide.none),
        subtitle: Text('2 Accounts', style: theme.textTheme.bodyMedium),
        trailing: isExpanded
            ? Assets.images.arrowUp.image(
                width: 24.w,
                height: 24.h,
                fit: BoxFit.cover,
              )
            : Assets.images.arrowDown.image(
                width: 24.w,
                height: 24.h,
                fit: BoxFit.cover,
              ),
        onExpansionChanged: (expanded) {
          setState(() {
            isExpanded = expanded;
          });
        },
        childrenPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: isLightTheme
                    ? LightThemeColors.borderColor
                    : DarkThemeColors.borderColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(
                10.r,
              ), // Optional rounded corners
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text('Jhone FHSA', style: theme.textTheme.bodyMedium),
                  trailing: Text('\$50.00', style: theme.textTheme.bodyMedium),
                ),
                Divider(
                  height: 1,
                  color: Colors.grey.shade300,
                ), // Divider between children
                ListTile(
                  title: Text('FHSA JKL', style: theme.textTheme.bodyMedium),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.access_time, color: Colors.orange),
                      SizedBox(width: 4),
                      Text(
                        'In Progress',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
