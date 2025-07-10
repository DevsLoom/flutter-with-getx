import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HyperlinkedText extends StatelessWidget {
  final List<Object> textChunks;
  final bool underlined;
  final Color? color;

  const HyperlinkedText(
    this.textChunks, {
    super.key,
    this.color,
    this.underlined = true,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: textChunks.map((chunk) => _buildSpan(chunk)).toList(),
      ),
    );
  }

  InlineSpan _buildSpan(Object chunk) {
    if (chunk is String) {
      return TextSpan(text: chunk, style: Get.textTheme.bodyMedium);
    }

    // If the chunk is a tuple of 2 (text, callback)
    if (chunk is (String, VoidCallback)) {
      final (text, callback) = chunk;
      return _buildClickableWidgetSpan(text, callback, null);
    }

    // If the chunk is a tuple of 3 (text, callback, key)
    if (chunk is (String, VoidCallback, Key)) {
      final (text, callback, key) = chunk;
      return _buildClickableWidgetSpan(text, callback, key);
    }

    throw ArgumentError('Invalid chunk type: $chunk');
  }

  InlineSpan _buildClickableWidgetSpan(
    String text,
    VoidCallback onTap,
    Key? key,
  ) {
    return WidgetSpan(
      child: GestureDetector(
        key: key,
        onTap: onTap,
        child: Text(
          text,
          style: Get.textTheme.bodyMedium?.copyWith(
            decoration: underlined
                ? TextDecoration.underline
                : TextDecoration.none,
            color: color ?? Get.theme.colorScheme.primary,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.28,
            decorationThickness: 2,
            decorationColor: color ?? Get.theme.colorScheme.primary,
            decorationStyle: TextDecorationStyle.solid,
          ),
        ),
      ),
    );
  }
}
