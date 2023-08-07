import 'package:flutter/material.dart';
import 'package:flutter_application_2/controllers/theme_controller.dart';
import 'package:flutter_application_2/controllers/question_paper/question_paper_controller.dart';
import 'package:flutter_application_2/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

import 'bindings/intial_bindings.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  IntialBindings().dependencies();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: Get.find<ThemeController>().lightTheme,
    getPages: AppRoutes.routes(),
  ));
}
