// collection refrences
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

//another type for singletone
final fireStore = FirebaseFirestore.instance; //used through this app

final userRF = fireStore.collection("users");
final questionPaperRF = fireStore.collection('questionPapers');
// create based on created collection id
DocumentReference questionRF(
        {required String paperId, required String questionId}) =>
    questionPaperRF.doc(paperId).collection("questions").doc(questionId);
Reference get firebaseStorage => FirebaseStorage.instance.ref();
