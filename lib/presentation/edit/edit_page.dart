import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolistapp/domain/to_do_list_model.dart';
import 'package:todolistapp/presentation/edit/edit_model.dart';

class EditPage extends StatelessWidget {
  EditPage({this.todayList, this.everydayList, this.oneDayList, this.tabIndex});
  final ToDoListModel todayList;
  final ToDoListModel everydayList;
  final ToDoListModel oneDayList;
  final tabIndex;

  @override
  Widget build(BuildContext context) {
    final finalTitleEditingController = TextEditingController();
    final finalDetailEditingController = TextEditingController();

//    today
    final todayTitleEditingController = TextEditingController();
    final todayDetailEditingController = TextEditingController();

    if (todayList != null) {
      todayTitleEditingController.text = todayList.title;
      todayDetailEditingController.text = todayList.detail;
      finalTitleEditingController.text = todayTitleEditingController.text;
      finalDetailEditingController.text = todayDetailEditingController.text;
    }

//    everyday
    final everydayTitleEditingController = TextEditingController();
    final everydayDetailEditingController = TextEditingController();

    if (everydayList != null) {
      everydayTitleEditingController.text = everydayList.title;
      everydayDetailEditingController.text = everydayList.detail;
      finalTitleEditingController.text = everydayTitleEditingController.text;
      finalDetailEditingController.text = everydayDetailEditingController.text;
    }

    //    oneDay
    final oneDayTitleEditingController = TextEditingController();
    final oneDayDetailEditingController = TextEditingController();

    if (oneDayList != null) {
      oneDayTitleEditingController.text = oneDayList.title;
      oneDayDetailEditingController.text = oneDayList.detail;
      finalTitleEditingController.text = oneDayTitleEditingController.text;
      finalDetailEditingController.text = oneDayDetailEditingController.text;
    }

    return ChangeNotifierProvider<EditModel>(
      create: (_) => EditModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Details & Edition'),
        ),
        body: Consumer<EditModel>(builder: (context, model, child) {
          if (todayList != null) {
            model.listTitle = todayList.title;
            model.listDetail = todayList.detail;
          }
          if (everydayList != null) {
            model.listTitle = everydayList.title;
            model.listDetail = everydayList.detail;
          }
          if (oneDayList != null) {
            model.listTitle = oneDayList.title;
            model.listDetail = oneDayList.detail;
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                TextField(
                  controller: finalTitleEditingController,
                  onChanged: (val) {
                    model.listTitle = val;
                  },
                ),
                SizedBox(height: 10.0),
                Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                TextField(
                  controller: finalDetailEditingController,
                  onChanged: (val) {
                    model.listDetail = val;
                  },
                ),
                RaisedButton(
                  child: Text('OK'),
                  onPressed: () async {
//                    update
                    if (todayList != null) {
                      await model.updateTodayList(todayList);
                    }
                    if (everydayList != null) {
                      await model.updateEverydayList(everydayList);
                    }
                    if (oneDayList != null) {
                      await model.updateOneDayList(oneDayList);
                    }
//                    add
                    switch (tabIndex) {
                      case 0:
                        {
                          await model.addTodayList();
                        }
                        break;

                      case 1:
                        {
                          await model.addEveryDayList();
                        }
                        break;

                      case 2:
                        {
                          await model.addOneDayList();
                        }
                        break;
                    }
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
