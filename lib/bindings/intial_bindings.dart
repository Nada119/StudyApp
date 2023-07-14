import 'package:flutter_application_2/controllers/question_paper/auth_controller.dart';
import 'package:flutter_application_2/controllers/theme_controller.dart';
import 'package:get/get.dart';

import '../controllers/question_paper/question_paper_controller.dart';
import '../services/firebase_storage_service.dart';

class IntialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(FirebaseStorageService());
    Get.put(AuthController(), permanent: true); //what happens stay at memory
  }
}
