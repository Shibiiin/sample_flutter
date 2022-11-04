import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: StackView(),
  ));
}

class StackView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  appBar: AppBar(title: Text('Stack'),),

      body: Stack(
children: [
  Image.network("https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg",
    height: 150,
    width: double.infinity,
    fit: BoxFit.cover,
  ),

   Positioned(
   bottom: 10,
    right: 20,
    child: Container(
      color: Colors.cyan,
  padding: EdgeInsets.all(10),
  child:const Text("This is My Cover Image", style: TextStyle(fontSize: 25),),
    ),
  ),
        ],

        ),
      );
  }

}