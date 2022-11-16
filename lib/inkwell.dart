import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: inkk(),
  ));
}
class inkk extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _inkkState();

}

class _inkkState  extends State<inkk>{

  var inkwell ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ink Well'),centerTitle: true,),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              setState(() {
                inkwell = 'Inkwell tapped';
              });
            },
            onLongPress: () {
              setState(() {
                inkwell = 'Inkwell long press';
              });
            },
            child: Container(
              height: 50,
              width: 50,
              color: Colors.grey,
              child:const Center(
                child: Text('Tap', style: TextStyle(fontSize: 20),),
              )
          ),
          ),
        ],
      ),
    ),

    );
  }
}

