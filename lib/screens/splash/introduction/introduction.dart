import 'package:flutter/material.dart';
import 'package:flutter_application_2/configs/themes/app_colors.dart';
import 'package:flutter_application_2/widgets/app_circle_button.dart';
import 'package:get/get.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(gradient: mainGradient(context)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  size: 65,
                ),
                const SizedBox(height: 40),
                Text(
                  "This is a study app. You can use it as you want. If you understand how it works, you will be able to scale it. With this, you will master Firebase backend and Flutter frontend. - Nada Amr",
                  style: TextStyle(
                    fontSize: 18,
                    color: onSurfaceTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                AppCircleButton(
                  onTap: () {
                    // Navigate to the home screen page
                    Get.offAllNamed("/home");
                  },
                  child: const Icon(Icons.arrow_forward, size: 35),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
