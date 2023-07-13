import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/bindings/intial_bindings.dart';
import 'package:flutter_application_2/controllers/theme_controller.dart';
import 'package:flutter_application_2/data_uploader_screen.dart';
import 'package:flutter_application_2/routes/app_routes.dart';
import 'package:flutter_application_2/screens/splash/introduction/introduction.dart';
import 'package:flutter_application_2/screens/splash/splash_screen.dart';
import 'package:flutter_application_2/screens/splash/home/home_screen.dart';
import 'package:get/get.dart';
import 'configs/themes/app_light_theme.dart';
import 'firebase_options.dart';

/*Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(GetMaterialApp(home: DataUploaderScreen()));
}*/

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  IntialBindings().dependencies();
  runApp(GetMaterialApp(
    theme: Get.find<ThemeController>().darkTheme,
    getPages: AppRoutes.routes(),
  ));
}
