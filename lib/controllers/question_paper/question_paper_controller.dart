import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/firebase_ref/refrences.dart';
import 'package:flutter_application_2/models/question_paper_model.dart';
import 'package:flutter_application_2/services/firebase_storage_service.dart';
import 'package:get/get.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = ["biology", "chemistry", "maths", "physics"];

    try {
      //download data
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF
          .get(); //object type of firebase, get data from collecction

      //returns a list, to look in it, create an object
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();

      allPapers.assignAll(paperList);

      for (var paper in paperList) {
        final imgUrl =
            await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imgUrl;
      }
      allPapers.assignAll(paperList);

/*
      //download images
      for (var img in imgName) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(img);
        if (imgUrl != null) {
          allPaperImages.addAll([imgUrl]); // Use addAll to ensure reactivity
        }
      }*/
    } catch (e) {
      print(e);
    }
  }
}
