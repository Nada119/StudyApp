import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/controllers/question_paper/auth_controller.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

//we changed class name because of conflicts
class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();

  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void toogleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void signIn() {}

  void website() {
    _launch("https://www.dbestech.com"); //random website
  }

  void facebook() {
    _launch("https://www.facebook.com"); //random account
  }

  void email() {
    //to send directly like IP kda
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'info@bestech.com',
    );
    _launch(emailLaunchUri.toString());
  }

  Future<void> _launch(String url) async {
    if (!await launch(url)) {
      throw 'could not launch ${url}'; //$url
    }
  }
}
