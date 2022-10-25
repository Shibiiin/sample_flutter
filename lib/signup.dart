import 'package:flutter/material.dart';
import 'package:sample_flutter/home.dart';

class Signup extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
    child: AppBar(
    automaticallyImplyLeading: false,
    title: const Text(
    "Sign up ",
    style: TextStyle(fontSize: 30),
    ),
      centerTitle: true,
    ),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Sign up

         // const Text("Sign Up",
         //  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)
         // ),
            const Padding(padding: EdgeInsets.only(top: 150, right: 150, left:  150 ),
            child: Text(
                "Sign Up", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
            ),



            TextButton(onPressed: () {
  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
} , child: Text('Back To Home Page'))

          ],
        ),
      )
      );

  }



}