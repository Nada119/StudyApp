import 'package:flutter/material.dart';
import 'package:flutter_application_2/configs/themes/ui_parameters.dart';
import 'package:flutter_application_2/controllers/question_paper/question_paper_controller.dart';
import 'package:flutter_application_2/screens/splash/home/question_card.dart';
import 'package:flutter_application_2/widgets/content_area.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: ContentArea(
        addPadding: false,
        child: Obx(
          () => ListView.separated(
            padding: UIParameters.mobileScreenPadding,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return QuestionCard(
                model: _questionPaperController.allPapers[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 20);
            },
            itemCount: _questionPaperController.allPapers.length,
          ),
        ),
      ),
    );
  }
}
