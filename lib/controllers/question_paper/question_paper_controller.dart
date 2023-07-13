import 'package:flutter_application_2/services/firebase_storage_service.dart';
import 'package:get/get.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  getAllPapers() async {
    List<String> imgName = ["biology", "chemistry", "maths", "physics"];

    try {
      for (var img in imgName) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(img);
        allPaperImages
            .add(imgUrl!); //we had to make sure that it isn't empty (!)
      }
    } catch (e) {
      print(e);
    }
  }
}
