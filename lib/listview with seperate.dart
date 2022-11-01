import 'package:flutter/material.dart';
void main(){

    return runApp( MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListViewSep(),
    ));
}
class ListViewSep extends StatelessWidget{

  var datas = <String>['Data1','data2','data3','data4','dtas5'];
  var colors = <int>[300,400,500,600,800];
var sepcol = [200,300,400,500,700];
  @override
  Widget build(BuildContext context) {

   return Scaffold(
     body: ListView.separated(

         itemBuilder: (context, index){
           return Card(
             child: Container(
               height: 35,
    color: Colors.green[colors[index]],
    child: Text(datas[index]),
             ),
           );
         },
         separatorBuilder: (context, index){
           return Icon(Icons.accessibility_outlined, color: Colors.red[sepcol[index]],);

         },
         itemCount: datas.length,
     ),


   );
  }

}