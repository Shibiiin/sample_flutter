import 'package:flutter/material.dart';


void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ListView(),
  ));
}


class ListViewBuilder extends StatelessWidget{
  var datas = <String>['Data1','data2','data3'];
  var colors = <int>[300,500,800];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('List view Builder',
      style: TextStyle(fontSize: 35),),
      centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: datas.length,
          itemBuilder: (BuildContext cntx , int index){
            return Card(

              child: Container(
                height: 50,
color: Colors.red[colors[index]],
                child: Center(child: Text(datas[index]),),
              ),
            );
          }),

    );
  }

}