import 'package:flutter_application_2/controllers/question_paper/question_paper_controller.dart';
import 'package:flutter_application_2/controllers/zoom_drawer_controller.dart';
import 'package:flutter_application_2/screens/splash/home/home_screen.dart';
import 'package:flutter_application_2/screens/splash/login/login_screen.dart';
import 'package:flutter_application_2/screens/splash/splash_screen.dart';

import 'package:get/get.dart';

import '../screens/splash/introduction/introduction.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(
          name: '/',
          page: () => SplashScreen(),
        ),
        // List of pages in your app

        GetPage(
          name: '/introduction',
          page: () => AppIntroductionScreen(),
        ),

        GetPage(
          name: '/home',
          page: () => HomeScreen(),
          binding: BindingsBuilder(() {
            Get.put(QuestionPaperController());
            Get.put(MyZoomDrawerController());
          }),
        ),
        GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
      ];
}
