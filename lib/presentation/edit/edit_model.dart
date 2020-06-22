import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todolistapp/domain/to_do_list_model.dart';

class EditModel extends ChangeNotifier {
  String listTitle = '';
  String listDetail = '';

  Future updateTodayList(ToDoListModel toDoListModel) async {
    final document = Firestore.instance
        .collection('today')
        .document(toDoListModel.documentID);
    await document.updateData(
      {
        'title': listTitle,
        'detail': listDetail,
        'createdAt': Timestamp.now(),
      },
    );
  }

  Future updateEverydayList(ToDoListModel toDoListModel) async {
    final document = Firestore.instance
        .collection('everyday')
        .document(toDoListModel.documentID);
    await document.updateData(
      {
        'title': listTitle,
        'detail': listDetail,
        'createdAt': Timestamp.now(),
      },
    );
  }

  Future updateOneDayList(ToDoListModel toDoListModel) async {
    final document = Firestore.instance
        .collection('oneDay')
        .document(toDoListModel.documentID);
    await document.updateData(
      {
        'title': listTitle,
        'detail': listDetail,
        'createdAt': Timestamp.now(),
      },
    );
  }
}
