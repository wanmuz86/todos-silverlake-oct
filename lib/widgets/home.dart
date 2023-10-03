import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'add.dart';
import 'detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _todos = [

  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // String -> List<dynamic>
    var todosString = prefs.getString("todos");
    if (todosString != null){
      // jsonDecode transform a String into a List<dynamic>
      var todoList = jsonDecode(todosString);
      setState(() {
        _todos = todoList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),
      actions: [
        IconButton(onPressed: () async {
          // 1) In receiver, I am going to WAIT for AddPage to finish, and receive the  passed item
          // If you use await, you need to add async at the nearest function {}
          var itemPassed = await Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPage()));

          // 3) Update the code to process the passed item

          if (itemPassed != null){
            _todos.add(itemPassed);


            // SAVE THE DATA IN SHARED PREFERENCE
            // Open Shared PReference manager
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            // Save with file name "todos"
            // Shared Preference only allow you to save : String, Int, Double, Bool
            // Our data type is List of Map <String,String>
            // Transform/Encode the List<Map<String,String> to String = jsonEncode
            prefs.setString("todos", jsonEncode(_todos));


            setState(() {
              _todos;
            });
          }


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
            return Card(
              child: ListTile(
                title: Text(_todos[index]["name"]!),
                subtitle: Text(_todos[index]["place"]!),
                trailing: Icon(Icons.chevron_right),
                onTap:() {
                  // 3)  Pass the item as  argument of Detail Page
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailPage(item: _todos[index],)));
                }
              ),
            );
          }
      ),
    );
  }
}
