import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../controllers/notification_screen_controller.dart';

class NotificationListScreen extends GetView<NotificationScreenController> {
  const NotificationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [],
      ),
    );
  }
}
