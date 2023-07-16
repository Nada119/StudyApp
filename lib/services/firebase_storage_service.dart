import 'package:flutter_application_2/firebase_ref/refrences.dart';
import 'package:get/get.dart';

class FirebaseStorageService extends GetxService {
  Future<String?> getImage(String? imgName) async {
    if (imgName == null) {
      return null;
    }
    try {
      var urlRef = firebaseStorage
          .child("question_paper_images")
          .child("${imgName.toLowerCase()}.png");
      var imgURL = await urlRef.getDownloadURL();

      print("Image URL: $imgURL"); // Print the retrieved image URL

      return imgURL;
    } catch (e) {
      print("Error retrieving image: $e"); // Print any error message
      return null;
    }
  }
}
