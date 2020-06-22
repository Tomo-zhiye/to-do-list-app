import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolistapp/presentation/edit/edit_page.dart';
import 'package:todolistapp/presentation/main/main_model.dart';

void main() {
  runApp(ToDoListApp());
}

class ToDoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel()..fetchListTiles(),
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text('To-Do List'),
              bottom: TabBar(
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
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {},
            ),
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
}
