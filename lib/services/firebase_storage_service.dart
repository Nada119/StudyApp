import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class FirebaseStorageService extends GetxService {
  final Reference _firebaseStorage = FirebaseStorage.instance.ref();

  Future<String?> getImage(String? imgName) async {
    if (imgName == null) {
      return null;
    }
    try {
      var urlRef = _firebaseStorage
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
