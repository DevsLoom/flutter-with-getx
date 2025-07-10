import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageNavigationService {
  static generalNavigation(
    String nextScreen, {
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    Get.toNamed(
      nextScreen,
      arguments: arguments,
      id: id,
      preventDuplicates: preventDuplicates = true,
      parameters: parameters,
    );
  }

  static removeAndNavigate(
    String nextScreen, {
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) {
    Get.offNamed(
      nextScreen,
      arguments: arguments,
      id: id,
      preventDuplicates: preventDuplicates = true,
      parameters: parameters,
    );
  }

  static Future<void> removeAllAndNavigate(
    String nextScreen, {
    bool Function(Route<dynamic>)? predicate,
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) async {
    Get.offAllNamed(
      nextScreen,
      predicate: predicate,
      arguments: arguments,
      id: id,
      parameters: parameters,
    );
  }

  static backScreen<T>({T? result}) {
    Get.back(result: result ?? true);
  }
}
