import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

//we changed class name because of conflicts
class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  @override
  void onReady() {
    super.onReady();
  }

  void toogleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {}

  void signIn() {}

  void website() {}

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
