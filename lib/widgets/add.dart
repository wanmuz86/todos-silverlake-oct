import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  var nameEditingController = TextEditingController();
  var descEditingController = TextEditingController();
  var placeEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Add Page"),),
      body: Center(
        child: Column(
          children: [
            Text("Insert following information"),
            TextField(decoration: InputDecoration(hintText: "Enter item name"), controller: nameEditingController,),
            TextField(decoration: InputDecoration(hintText: "Enter item description"), controller: descEditingController,),
            TextField(decoration: InputDecoration(hintText: "Enter item place"), controller: placeEditingController,),
            ElevatedButton(onPressed: (){

              print(nameEditingController.text);
              print(placeEditingController.text);
              print(descEditingController.text);
              if (nameEditingController.text  == "" || placeEditingController.text == "" || descEditingController.text == ""){
                print("Later add toast to remind user to fill in all info");
              }
              else {
                var newItem = {
                  "name": nameEditingController.text,
                  "place": placeEditingController.text,
                  "desc": descEditingController.text
                };

                Navigator.pop(context, newItem);
              }
            }, child: Text("Add new item"))

          ],
        ),
      ),
    );
  }
}
