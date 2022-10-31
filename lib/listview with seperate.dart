import 'package:flutter/material.dart';

class ListViewSeparated extends StatelessWidget{

  var datas = <String>['Data1','data2','data3'];
  var colors = <int>[300,500,800];

  @override
  Widget build(BuildContext context) {



   return Scaffold(
     body: ListView.separated(
         itemBuilder: (context, index){
           return Card(
    color: Colors.green[colors[index]],
    child: Text(datas[index]),
           );
         },
         separatorBuilder: (context, index){
           return Divider();
         },
         itemCount: datas.length,
     ),


   );
  }

}