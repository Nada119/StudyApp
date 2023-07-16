import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/configs/themes/app_dark_theme.dart';
import 'package:flutter_application_2/configs/themes/app_light_theme.dart';
import 'package:flutter_application_2/configs/themes/ui_parameters.dart';

const Color onSurfaceTextColor = Colors.white;

const mainGradiantLight = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [primaryLightColorLight, primaryColorLight],
);

const mainGradiantDark = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [primaryDarkColorDark, primaryColorDark],
);

LinearGradient mainGradient() =>
    UIParameters.isDarkMode() ? mainGradiantDark : mainGradiantLight;
//return one of the themes based on the gradient check

Color customScaffoldColor(BuildContext context) => UIParameters.isDarkMode()
    ?const Color(0xFF2e3c62) : const Color.fromARGB(255, 240, 237, 255);
