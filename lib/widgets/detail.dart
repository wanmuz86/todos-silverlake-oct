import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  // 1) IN receiver, add a variable where the item will be stored
    Map <String,dynamic> item;
   // 2) Create constructor of the receiver, ClassName({})
   DetailPage({required this.item});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Page"),),
      body:Center(
        child: Column(
          children: [
            Text(item["name"]!),
            SizedBox(height: 8,),
            Text(item["desc"]!),
            SizedBox(height: 8,),
            Text(item["place"]!)
          ],
        ),
      )
    );
  }
}
