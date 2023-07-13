import 'package:flutter_application_2/controllers/question_paper/auth_controller.dart';
import 'package:flutter_application_2/controllers/theme_controller.dart';
import 'package:get/get.dart';

class IntialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true); //what happens stay at memory
  }
}
