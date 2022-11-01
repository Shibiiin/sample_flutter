import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GridExte(),
  ));
}

class GridExte extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GRid View Extent'),),
      body: GridView.extent(maxCrossAxisExtent: 50,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: EdgeInsets.all(10),
      shrinkWrap: true,
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.blue,
        ),Container(
          color: Colors.blue,
        ),Container(
          color: Colors.blue,
        ),Container(
          color: Colors.blue,
        ),Container(
          color: Colors.blue,
        ),Container(
          color: Colors.blue,
        ),Container(
          color: Colors.blue,
        ),Container(
          color: Colors.blue,
        ),Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.pink,
        ),
        Container(
          color: Colors.purple,
        ),

      ],),


    );
  }

}