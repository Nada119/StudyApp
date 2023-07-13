import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

Reference get firebaseStorage => FirebaseStorage.instance.ref();

class FirebaseStorageService extends GetxService {
  Future<String?> getImage(String? imgName) async {
    if (imgName == null) {
      return null;
    }
    try {
      var urlRef = firebaseStorage
          .child("question_paper_images") // folder name
          .child("${imgName.toLowerCase()}.png"); // image name
      var imgURL = await urlRef.getDownloadURL();
      return imgURL;
    } catch (e) {
      return null;
    }
  }
}
