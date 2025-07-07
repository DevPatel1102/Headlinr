import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSettingsController extends GetxController {
  var isDarkMode = Get.isDarkMode.obs;

  void toggleTheme(bool value) {
    isDarkMode.value = value;
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
  }
}