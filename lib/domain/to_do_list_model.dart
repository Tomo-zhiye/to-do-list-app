import 'package:cloud_firestore/cloud_firestore.dart';

class ToDoListTile {
  String documentID;
  String title;
  String detail;

  ToDoListTile(DocumentSnapshot doc) {
    title = doc['title'];
    detail = doc['detail'];
    documentID = doc.documentID;
  }
}
