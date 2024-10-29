import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/flower_care_reminder_controller.dart';

class FlowerCareReminderView extends GetView<FlowerCareReminderController> {
  const FlowerCareReminderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlowerCareReminderView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FlowerCareReminderView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
