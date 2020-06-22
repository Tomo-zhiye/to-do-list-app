import 'package:cloud_firestore/cloud_firestore.dart';

class ToDoListModel {
  String documentID;
  String title;
  String detail;

  ToDoListModel(DocumentSnapshot doc) {
    title = doc['title'];
    detail = doc['detail'];
    documentID = doc.documentID;
  }
}
