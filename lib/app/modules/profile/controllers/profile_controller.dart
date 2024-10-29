import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
final isDarkMode = false.obs;
  final adminName = 'Admin 1'.obs;
  final profileImage = Rx<File?>(null);
  final totalOrders = 0;
  final activeOrders = 0;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void updateProfileImage() {
    // Implement image picker logic
  }

  void logout() {
    // Implement logout logic
  }
}
