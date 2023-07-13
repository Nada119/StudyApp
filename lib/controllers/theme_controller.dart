import 'package:flutter/material.dart';
import 'package:flutter_application_2/configs/themes/app_dark_theme.dart';
import 'package:flutter_application_2/configs/themes/app_light_theme.dart';
import 'package:get/get.dart';

// Automatic theme switching controller
class ThemeController extends GetxController {
  late ThemeData _darkTheme;
  late ThemeData _lightTheme;

  // Called automatically after the widget is allocated in memory
  // We need to initialize the app before getting data from the server
  @override
  void onInit() {
    super.onInit();
    initializeThemeData();
  }

  initializeThemeData() {
    DarkTheme darkTheme = DarkTheme();
    LightTheme lightTheme = LightTheme();

    _darkTheme = darkTheme.buildDarkTheme();
    _lightTheme = lightTheme.buildLightTheme();
  }

  ThemeData get darkTheme => _darkTheme;

  ThemeData get lightTheme => _lightTheme;
}
