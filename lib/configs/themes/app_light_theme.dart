import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/configs/themes/sub_theme_data_mixin.dart';

// Global variables
const Color primaryLightColorLight = Color(0xFF3ac3cb);
const Color primaryColorLight = Color(0xFFf85187);
const Color mainTextColorLight = Color.fromARGB(255, 40, 40, 40);
const Color cardColor = Color.fromARGB(255, 254, 254, 255);

// We use "with" instead of "extend" for mixins
// Here we will do all the setup and just call it afterwards
class LightTheme with SubThemeData {
  ThemeData buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
      primaryColor: primaryColorLight,
      iconTheme: getIconTheme(),
      cardColor: cardColor,
      textTheme: getTextThemes().apply(
        bodyColor: mainTextColorLight,
        displayColor: mainTextColorLight,
      ),
    );
  }
}
