import 'package:flutter/material.dart';
import 'package:flutter_application_2/configs/themes/app_colors.dart';
import 'package:flutter_application_2/configs/themes/ui_parameters.dart';

TextStyle cardTitles(context) => TextStyle(
      color: UIParameters.isDarkMode()
          ? Theme.of(context).textTheme.bodyText1!.color //error without !
          : Theme.of(context).primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

const detailText = TextStyle(fontSize: 12);

const headerText = TextStyle(
    fontSize: 22, fontWeight: FontWeight.w700, color: onSurfaceTextColor);
