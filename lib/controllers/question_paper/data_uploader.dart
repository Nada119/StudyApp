import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/firebase_ref/loading_status.dart';
import 'package:flutter_application_2/firebase_ref/refrences.dart';
import 'package:flutter_application_2/models/question_paper_model.dart';
import 'package:get/get.dart';

// for admins
class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  } //upload data to firebase, upload it once call it once when it is ready

  final loadingStatus = LoadingStatus
      .loading.obs; //RX type, whenever this value changes flutter know it
  Future uploadData() async {
    try {
      loadingStatus.value = LoadingStatus.loading;

      final fireStore = FirebaseFirestore.instance;
      final manifestContent = await DefaultAssetBundle.of(Get.context!)
          .loadString("AssetManifest.json");
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);

      final papersInAssets = manifestMap.keys
          .where((path) =>
              path.startsWith("assets/DB/papers") && path.contains(".json"))
          .toList();

      List<QuestionPaperModel> questionPapers = [];
      for (var paper in papersInAssets) {
        String stringPaperContent = await rootBundle.loadString(paper);
        questionPapers
            .add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
      }

      var batch = fireStore.batch();

      for (var paper in questionPapers) {
        batch.set(questionPaperRF.doc(paper.id), {
          "title": paper.title,
          "image_url": paper.imageUrl,
          "description": paper.description,
          "times_seconds": paper.timeSeconds,
          "questions_count":
              paper.questions == null ? 0 : paper.questions!.length
        });

        for (var questions in paper.questions!) {
          final questionPath =
              questionRF(paperId: paper.id, questionId: questions.id);
          batch.set(questionPath, {
            "question": questions.question,
            "correct_answers": questions.correctAnswer
          }); //for sub collections, data=fields

          for (var answer in questions.answers) {
            batch.set(
                questionPath.collection("answers").doc("answer.identifier"),
                {"identifier": answer.identifier, "answer": answer.answer});
          }
        }
      }

      await batch
          .commit(); // Commit the batch once, after all the `set` operations
      loadingStatus.value = LoadingStatus.completed;

      print("Data uploaded successfully.");
    } catch (e) {
      print("Error uploading data: $e");
    }
  }
}
