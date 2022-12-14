import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NavigDrawer(),
  ));
}

class NavigDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return const Scaffold(
     body: Center(
       child: Text('Welcome'),
     ),
   );
  }

}