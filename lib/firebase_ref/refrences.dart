// collection refrences
import 'package:cloud_firestore/cloud_firestore.dart';

final fireStore = FirebaseFirestore.instance; //used through this app

final questionPaperRF = fireStore.collection('questionPapers');
// create based on created collection id
DocumentReference questionRF(
        {required String paperId, required String questionId}) =>
    questionPaperRF.doc(paperId).collection("questions").doc(questionId);
