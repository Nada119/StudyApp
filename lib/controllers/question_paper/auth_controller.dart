import 'package:get/get.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 20));
    navigateToIntroduction();
  }

  void navigateToIntroduction() {
    Get.offAllNamed("/introduction");
  }
}
