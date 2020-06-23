import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolistapp/domain/to_do_list_model.dart';
import 'package:todolistapp/presentation/edit/edit_page.dart';
import 'package:todolistapp/presentation/main/main_model.dart';

void main() {
  runApp(ToDoListApp());
}

class ToDoListApp extends StatelessWidget {
  TabScope _tabScope = TabScope.getInstance();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel()..fetchListTiles(),
        child: DefaultTabController(
          length: 3,
          initialIndex: _tabScope.tabIndex,
          child: Scaffold(
            appBar: AppBar(
              title: Text('To-Do List'),
              bottom: TabBar(
                onTap: (index) => _tabScope.setTabIndex(index),
                tabs: [
                  Tab(
                    child: Text(
                      'Today',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Everyday',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'One day',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton:
                Consumer<MainModel>(builder: (context, model, child) {
              return FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () async {
                  final tabIndex = _tabScope.tabIndex;
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => EditPage(
                        tabIndex: tabIndex,
                      ),
                    ),
                  );
                  model.fetchListTiles();
                },
              );
            }),
            body: Consumer<MainModel>(builder: (context, model, child) {
//              today
              final todayLists = model.todayLists;
              final todayListTiles = todayLists
                  .map((todayList) => ListTile(
                        title: Text(todayList.title),
                        trailing: IconButton(
                          icon: Icon(Icons.details),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditPage(
                                  todayList: todayList,
                                ),
                                fullscreenDialog: true,
                              ),
                            );
                            model.fetchListTiles();
                          },
                        ),
                        onLongPress: () async {
                          await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                    'Are you sure? this is ${todayList.title}.'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('OK'),
                                    onPressed: () async {
                                      Navigator.of(context).pop();
                                      await deletList(
                                          model, context, todayList);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ))
                  .toList();
//              everyday
              final everydayLists = model.everydayLists;
              final everydayListTiles = everydayLists
                  .map((everydayList) => ListTile(
                        title: Text(everydayList.title),
                        trailing: IconButton(
                          icon: Icon(Icons.details),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditPage(
                                  everydayList: everydayList,
                                ),
                                fullscreenDialog: true,
                              ),
                            );
                            model.fetchListTiles();
                          },
                        ),
                        onLongPress: () async {
                          await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                      'Are you sure? this is ${everydayList.title}.'),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('OK'),
                                      onPressed: () async {
                                        Navigator.of(context).pop();
                                        await deletList(
                                            model, context, everydayList);
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                      ))
                  .toList();
//              oneDay
              final oneDayLists = model.oneDayLists;
              final oneDayListTiles = oneDayLists
                  .map((oneDayList) => ListTile(
                        title: Text(oneDayList.title),
                        trailing: IconButton(
                          icon: Icon(Icons.details),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditPage(
                                  oneDayList: oneDayList,
                                ),
                                fullscreenDialog: true,
                              ),
                            );
                            model.fetchListTiles();
                          },
                        ),
                        onLongPress: () async {
                          print(_tabScope.tabIndex);
                          await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                      'Are you sure? this is ${oneDayList.title}.'),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('OK'),
                                      onPressed: () async {
                                        Navigator.of(context).pop();
                                        await deletList(
                                            model, context, oneDayList);
                                      },
                                    )
                                  ],
                                );
                              });
                        },
                      ))
                  .toList();
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Center(
                      child: TabBarView(
                        children: [
                          Container(
                            width: double.infinity,
                            color: Colors.white,
                            child: ListView(
                              children: todayListTiles,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            color: Colors.white,
                            child: ListView(
                              children: everydayListTiles,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            color: Colors.white,
                            child: ListView(
                              children: oneDayListTiles,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Future deletList(MainModel model, BuildContext context,
      ToDoListModel toDoListModel) async {
    try {
      switch (_tabScope.tabIndex) {
        case 0:
          {
            await model.deleteTodayList(toDoListModel);
          }
          break;

        case 1:
          {
            await model.deleteEverydayList(toDoListModel);
          }
          break;

        case 2:
          {
            await model.deleteOneDayList(toDoListModel);
          }
          break;
      }
      await model.fetchListTiles();
    } catch (e) {
      await _showDialog(context, e.String());
    }
  }

  Future _showDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class TabScope {
  // singleton class
  static TabScope _tabScope;
  int tabIndex = 0;

  static TabScope getInstance() {
    if (_tabScope == null) _tabScope = TabScope();

    return _tabScope;
  }

  void setTabIndex(int index) {
    tabIndex = index;
  }
}
