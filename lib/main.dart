import 'package:flutter/material.dart';

void main() {
  runApp(ToDoListApp());
}

class ToDoListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
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
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: TabBarView(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                '・',
                                style: TextStyle(fontSize: 30,),
                              ),
                              Text(
                                '猫',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.check_box,
                                color: Colors.green,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                '・',
                                style: TextStyle(fontSize: 30,),
                              ),
                              Text(
                                '猫',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.check_box,
                                color: Colors.green,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                '・',
                                style: TextStyle(fontSize: 30,),
                              ),
                              Text(
                                '猫',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.check_box,
                                color: Colors.green,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                '・',
                                style: TextStyle(fontSize: 30,),
                              ),
                              Text(
                                '猫',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.check_box,
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.directions_transit),
                    Icon(Icons.directions_bike),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}