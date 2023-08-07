import 'package:flutter/material.dart';
import 'package:flutter_application_2/configs/themes/app_colors.dart';
import 'package:flutter_application_2/configs/themes/custom_text_styles.dart';
import 'package:flutter_application_2/configs/themes/ui_parameters.dart';
import 'package:flutter_application_2/controllers/question_paper/question_paper_controller.dart';
import 'package:flutter_application_2/controllers/zoom_drawer_controller.dart';
import 'package:flutter_application_2/screens/splash/home/menu_screen.dart';
import 'package:flutter_application_2/screens/splash/home/question_card.dart';
import 'package:flutter_application_2/widgets/app_circle_button.dart';
import 'package:flutter_application_2/widgets/app_icons.dart';
import 'package:flutter_application_2/widgets/content_area.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

//so2al 3la el extends
class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    final QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(body: GetBuilder<MyZoomDrawerController>(
      builder: (_) {
        return ZoomDrawer(
          borderRadius: 50.0,
          controller: _.zoomDrawerController,
          showShadow: true,
          angle: 0.0,
          style: DrawerStyle.defaultStyle,
          menuBackgroundColor: Colors.white.withOpacity(0.5),
          slideWidth: MediaQuery.of(context).size.width * 0.6,
          menuScreen: MenuScreen(),
          mainScreen: Container(
            decoration: BoxDecoration(gradient: mainGradient()),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(mobileScreenPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppCircleButton(
                          child: const Icon(AppIcons.menuLeft),
                          onTap: controller.toogleDrawer,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              const Icon(AppIcons.peace),
                              Text(
                                "Hello Friend",
                                style: detailText.copyWith(
                                  color: onSurfaceTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(mobileScreenPadding),
                    child: const Text(
                      "What do you want to learn today ?",
                      style: headerText,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ContentArea(
                        addPadding: false,
                        child: Obx(
                          () => ListView.separated(
                            padding: UIParameters.mobileScreenPadding,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return QuestionCard(
                                model:
                                    _questionPaperController.allPapers[index],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(height: 20);
                            },
                            itemCount:
                                _questionPaperController.allPapers.length,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
