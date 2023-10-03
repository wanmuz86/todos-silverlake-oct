import 'package:flutter/material.dart';

import 'add.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _todos = [
    {
      "name": "Learn Navigation",
      "desc": "Simple, pass forward and pass back data",
      "place": "Iverson Teams"
    },
    {"name": "Lunch", "desc": "Order Mc donalds", "place": "Office"},
    {
      "name": "ListView",
      "desc": "Listview, ListTile, Card",
      "place": "Iverson Teams"
    },
    {
      "name": "Shared Preference",
      "desc": "Learn how to save data and retrieve data",
      "place": "Iverson teams"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),
      actions: [
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPage()));


        }, icon: Icon(Icons.add))
      ],),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          // How many rows are there = the length of your data/List..
          itemCount: _todos.length,

          // What to show for each row (index)
          // For each row, I am going to show a Container of height 50, of color amber
          // Inside each row, I will show a Text that will show the todos for the row and value name
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(_todos[index]["name"]!),
              subtitle: Text(_todos[index]["place"]!),
              trailing: Icon(Icons.chevron_right),
            );
          }
      ),
    );
  }
}
