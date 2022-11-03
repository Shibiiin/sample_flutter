import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RowCard(),
  ));
}
class RowCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar:  AppBar(
          backgroundColor: const Color(0xFF0099a9),
        ),
        body: Column(children: <Widget>[
          Row(
            //ROW 1
            children: [
              Container(
                color: Colors.orange,
                margin: EdgeInsets.all(25.0),
                child: const FlutterLogo(
                  size: 60.0,
                ),
              ),
              Container(
                color: Colors.blue,
                margin: EdgeInsets.all(25.0),
                child: FlutterLogo(
                  size: 60.0,
                ),
              ),

            ],
          ),
          Row(//ROW 2
              children: [
                Container(
                  color: Colors.orange,
                  margin: EdgeInsets.all(25.0),
                  child: FlutterLogo(
                    size: 60.0,
                  ),
                ),
                Container(
                  color: Colors.blue,
                  margin: EdgeInsets.all(25.0),
                  child: FlutterLogo(
                    size: 60.0,
                  ),
                ),

              ]),
          Row(// ROW 3
              children: [
                Container(
                  color: Colors.orange,
                  margin: EdgeInsets.all(25.0),
                  child: FlutterLogo(
                    size: 60.0,
                  ),
                ),
                Container(
                  color: Colors.blue,
                  margin: EdgeInsets.all(25.0),
                  child: FlutterLogo(
                    size: 60.0,
                  ),
                ),
              ]),


        ]));
  }
}