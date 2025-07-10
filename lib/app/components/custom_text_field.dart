import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/theme/dark_theme_colors.dart';
import '../../../config/theme/light_theme_colors.dart';
import '../data/local/my_shared_pref.dart';
import 'crash_safe_image_asset.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final Color? backgroundColor;
  final Color? borderColor;
  final String? prefixText;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final String? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final String? errorText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool readOnly;
  final bool expandes;
  final bool? enabled;
  final double? marginTop;
  final double? marginBottom;
  final double? marginLeft;
  final double? marginRight;
  final Widget? suffixWidget;
  final String? suffixIcon;
  final void Function()? suffixIconOnTap;
  final bool autofocus;
  final double topLeftBorderRadius;
  final double topRightBorderRadius;
  final double bottomLeftBorderRadius;
  final double bottomRightBorderRadius;
  final TextAlign textAlign;
  final void Function(bool)? onFocusChange;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final void Function()? onEditingComplete;
  final void Function()? onTap;

  const CustomTextField({
    super.key,
    this.controller,
    this.labelText,
    this.labelStyle,
    this.hintText,
    this.prefixIcon,
    this.backgroundColor,
    this.borderColor,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.suffixWidget,
    this.suffixIcon,
    this.suffixIconOnTap,
    this.prefixText,
    this.inputFormatters,
    this.maxLength,
    this.minLines,
    this.maxLines = 1,
    this.onChanged,
    this.onTap,
    this.expandes = false,
    this.marginTop,
    this.marginBottom,
    this.marginLeft,
    this.marginRight,
    this.topLeftBorderRadius = 35.0,
    this.topRightBorderRadius = 35.0,
    this.bottomLeftBorderRadius = 35.0,
    this.bottomRightBorderRadius = 35.0,
    this.errorText,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.onFieldSubmitted,
    this.onSaved,
    this.onEditingComplete,
    this.onFocusChange,
    this.autofocus = false,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLightTheme = MySharedPref.isLightTheme();
    return Padding(
      padding: EdgeInsets.fromLTRB(
        marginLeft ?? 0.w,
        marginTop ?? 12.h,
        marginRight ?? 0.w,
        marginBottom ?? 12.h,
      ),
      child: Container(
        height: 62.h,
        decoration: BoxDecoration(
          color:
              backgroundColor ??
              (isLightTheme
                  ? LightThemeColors.scaffoldBackgroundColor
                  : DarkThemeColors.scaffoldBackgroundColor),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(bottomLeftBorderRadius),
            bottomRight: Radius.circular(bottomRightBorderRadius),
            topLeft: Radius.circular(topLeftBorderRadius),
            topRight: Radius.circular(topRightBorderRadius),
          ),
        ),
        child: Focus(
          onFocusChange: onFocusChange,
          child: TextFormField(
            autofocus: autofocus,
            key: key,
            cursorHeight: 20,
            cursorColor: isLightTheme
                ? LightThemeColors.primaryColor
                : DarkThemeColors.primaryColor,
            style: theme.textTheme.bodyMedium,
            onTap: onTap,
            readOnly: readOnly,
            focusNode: focusNode,
            enabled: enabled,
            keyboardType: keyboardType,
            controller: controller,
            validator: validator,
            obscureText: obscureText,
            expands: expandes,
            inputFormatters: inputFormatters,
            maxLength: maxLength,
            maxLines: maxLines,
            minLines: minLines,
            textAlignVertical: TextAlignVertical.center,

            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              helperText: '',
              //alignLabelWithHint: true,
              fillColor:
                  backgroundColor ??
                  (isLightTheme
                      ? LightThemeColors.scaffoldBackgroundColor
                      : DarkThemeColors.scaffoldBackgroundColor),
              filled: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: 20.h,
                horizontal: 24.w,
              ),
              // EdgeInsets.only(
              //     left: 10.0,
              //     top: maxLines! > 1 ? 25 : 30,
              //     bottom: maxLines! > 1 ? 15 : 0),
              isDense: true,
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color:
                      borderColor ??
                      (isLightTheme
                          ? LightThemeColors.borderColor
                          : DarkThemeColors.borderColor),
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(bottomLeftBorderRadius),
                  bottomRight: Radius.circular(bottomRightBorderRadius),
                  topLeft: Radius.circular(topLeftBorderRadius),
                  topRight: Radius.circular(topRightBorderRadius),
                ),
              ),
              errorStyle: theme.textTheme.bodySmall?.copyWith(
                color: isLightTheme
                    ? LightThemeColors.errorColor
                    : DarkThemeColors.errorColor,
              ),
              errorMaxLines: 1,
              // error: Icon(Icons.h_mobiledata),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isLightTheme
                      ? LightThemeColors.errorColor
                      : DarkThemeColors.errorColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(bottomLeftBorderRadius),
                  bottomRight: Radius.circular(bottomRightBorderRadius),
                  topLeft: Radius.circular(topLeftBorderRadius),
                  topRight: Radius.circular(topRightBorderRadius),
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color:
                      borderColor ??
                      (isLightTheme
                          ? LightThemeColors.borderColor
                          : DarkThemeColors.borderColor),
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(bottomLeftBorderRadius),
                  bottomRight: Radius.circular(bottomRightBorderRadius),
                  topLeft: Radius.circular(topLeftBorderRadius),
                  topRight: Radius.circular(topRightBorderRadius),
                ),
              ),
              counterText: '',
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(bottomLeftBorderRadius),
                  bottomRight: Radius.circular(bottomRightBorderRadius),
                  topLeft: Radius.circular(topLeftBorderRadius),
                  topRight: Radius.circular(topRightBorderRadius),
                ),
                borderSide: BorderSide(
                  color:
                      borderColor ??
                      (isLightTheme
                          ? LightThemeColors.borderColor
                          : DarkThemeColors.borderColor),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(bottomLeftBorderRadius),
                  bottomRight: Radius.circular(bottomRightBorderRadius),
                  topLeft: Radius.circular(topLeftBorderRadius),
                  topRight: Radius.circular(topRightBorderRadius),
                ),
                borderSide: BorderSide(
                  color:
                      borderColor ??
                      (isLightTheme
                          ? LightThemeColors.borderColor
                          : DarkThemeColors.borderColor),
                ),
              ),
              labelText: labelText,
              labelStyle: labelStyle ?? theme.textTheme.labelMedium,
              hintText: hintText,
              hintStyle:
                  hintStyle ??
                  theme.textTheme.bodyMedium?.copyWith(
                    color: isLightTheme
                        ? LightThemeColors.hintTextColor
                        : DarkThemeColors.hintTextColor,
                  ),
              //prefixIcon:,
              prefixIcon: prefixIcon != null
                  ? Container(
                      padding: EdgeInsets.fromLTRB(24.0.w, 0.h, 0.0.w, 0.h),
                      height: 24.r,
                      width: 24.r,
                      child: CrashSafeImageAsset(
                        prefixIcon!,
                        color: isLightTheme
                            ? LightThemeColors.iconColor
                            : DarkThemeColors.iconColor,
                        fit: BoxFit.contain,
                      ),
                    )
                  : null,
              prefixText: prefixText,
              // prefixStyle: style,
              suffixIcon:
                  suffixWidget ??
                  (suffixIcon != null
                      ? InkWell(
                          onTap: suffixIconOnTap,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                              0.0.w,
                              0.h,
                              24.0.w,
                              0.h,
                            ),
                            height: 24.r,
                            width: 24.r,
                            child: CrashSafeImageAsset(
                              suffixIcon!,
                              fit: BoxFit.contain,
                              color: isLightTheme
                                  ? LightThemeColors.iconColor
                                  : DarkThemeColors.iconColor,
                            ),
                          ),
                        )
                      : null),

              errorText: errorText,
            ),
            textAlign: textAlign,
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            onSaved: onSaved,
            onEditingComplete: onEditingComplete,
          ),
        ),
      ),
    );
  }
}
