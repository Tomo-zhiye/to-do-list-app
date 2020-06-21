import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
            body: Consumer<MainModel>(builder: (context, model, child) {
              final todayLists = model.todayLists;
              final todayListTiles = todayLists
                  .map((list) => ListTile(
                        title: Text(list.title),
                      ))
                  .toList();

              final everydayLists = model.everydayLists;
              final everydayListTiles = everydayLists
                  .map((list) => ListTile(
                        title: Text(list.title),
                      ))
                  .toList();

              final oneDayLists = model.oneDayLists;
              final oneDayListTiles = oneDayLists
                  .map((list) => ListTile(
                        title: Text(list.title),
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
