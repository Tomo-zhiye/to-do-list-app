import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:todolistapp/domain/to_do_list_model.dart';

class MainModel extends ChangeNotifier {
  List<ToDoListTile> todayLists;
  List<ToDoListTile> everydayLists;
  List<ToDoListTile> oneDayLists;

  Future fetchListTiles() async {
//    Fetch Today's to-do list
    final todayDocs =
        await Firestore.instance.collection('today').getDocuments();
    final todayLists =
        todayDocs.documents.map((doc) => ToDoListTile(doc)).toList();
    this.todayLists = todayLists;
//    Fetch everyday to-do list
    final everyDayDocs =
        await Firestore.instance.collection('everyday').getDocuments();
    final everydayLists =
        everyDayDocs.documents.map((doc) => ToDoListTile(doc)).toList();
    this.everydayLists = everydayLists;
//    Fetch one day to-do list
    final oneDayDocs =
        await Firestore.instance.collection('oneDay').getDocuments();
    final oneDayLists =
        oneDayDocs.documents.map((doc) => ToDoListTile(doc)).toList();
    this.oneDayLists = oneDayLists;
    notifyListeners();
  }
}
