import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../config/theme/dark_theme_colors.dart';
import '../../config/theme/light_theme_colors.dart';
import '../data/local/my_shared_pref.dart';

class PinInputField extends StatefulWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String)? onCompleted;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int length;

  const PinInputField({
    super.key,
    this.controller,
    this.focusNode,
    this.onCompleted,
    this.validator,
    this.length = 6,
    this.onChanged,
  });

  @override
  State<PinInputField> createState() => _PinInputFieldState();
}

class _PinInputFieldState extends State<PinInputField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    if (widget.controller == null) _controller.dispose();
    if (widget.focusNode == null) _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).colorScheme.secondary;
    final bool isLightTheme = MySharedPref.isLightTheme();

    final defaultPinTheme = PinTheme(
      width: 60.w,
      height: 54.h,
      textStyle: Theme.of(
        context,
      ).textTheme.titleLarge?.copyWith(fontSize: 20.sp),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color: isLightTheme
            ? LightThemeColors.scaffoldBackgroundColor
            : DarkThemeColors.scaffoldBackgroundColor,
        border: Border.all(
          width: 1.w,
          color: isLightTheme
              ? LightThemeColors.borderColor
              : DarkThemeColors.borderColor,
        ),
      ),
    );

    return Pinput(
      key: widget.key,
      length: widget.length,
      controller: _controller,
      focusNode: _focusNode,
      defaultPinTheme: defaultPinTheme,
      separatorBuilder: (_) => const SizedBox(width: 8),
      validator: widget.validator,
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      onCompleted: widget.onCompleted,
      onChanged: widget.onChanged,
      cursor: Container(
        width: 2,
        height: 28,
        color: isLightTheme
            ? LightThemeColors.titleTextColor
            : DarkThemeColors.titleTextColor,
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(
            width: 2.w,
            color: isLightTheme
                ? LightThemeColors.borderColor
                : DarkThemeColors.borderColor,
          ),
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: secondaryColor.withValues(alpha: .35),
          border: Border.all(
            width: 2.w,
            color: isLightTheme
                ? LightThemeColors.primaryColor
                : DarkThemeColors.primaryColor,
          ),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyBorderWith(
        border: Border.all(color: Get.theme.colorScheme.error),
      ),
    );
  }
}
