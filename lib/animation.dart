import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


void main(){
  runApp(MaterialApp(
    home: Ani(),
  ));
}

class Ani extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

return MaterialApp(
  home: Scaffold(
    appBar: AppBar(title: Text('Animation'),
    centerTitle: true,
    ),
    body: Column(
       children: [
    Padding(padding: EdgeInsets.all(50),
       child:  Lottie.asset('assets/anima/hi.json',height: 200, width: 100),
  ),
         Center(
         child: Lottie.network('https://assets5.lottiefiles.com/packages/lf20_hqfbl3nn.json', height: 100, width: 100),
    ),
    ],

    ),
  ),
);
  }

}