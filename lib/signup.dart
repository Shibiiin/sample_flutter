import 'package:flutter/material.dart';
import 'package:sample_flutter/home.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Sign up ",
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
        ),
      ),
      body: ListView(
        //children: Column(
        children: [
          /// Welcome
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Welcome, Sign Up if you have Account",
              style: TextStyle(fontFamily: 'Fasthand',
                  fontWeight: FontWeight.w500, fontSize: 35),
            ),
          ),
/// Sign Up
          const Padding(
            padding: EdgeInsets.only(top: 30, right: 120, left: 160),
            child: Text(
              "Sign Up",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ),

          /// UserName Text field
          const Padding(padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.co_present, color: Colors.red,size: 30,),
                helperText: ("Must enter the Username"),
                labelStyle: TextStyle(fontSize: 19, color: Colors.blueAccent),
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.zero, bottomLeft: Radius.zero, bottomRight: Radius.zero)               )),
            ),
          ),

          /// Password Text field
          const Padding(padding: EdgeInsets.all(20),
            child: TextField(
              obscuringCharacter: "*",
              obscureText: true,
              decoration: InputDecoration(
                  icon: Icon(Icons.co_present, color: Colors.red,size: 30,),
                  helperText: ("Must enter the Username"),
                  labelStyle: TextStyle(fontSize: 19, color: Colors.blueAccent),
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.zero, bottomLeft: Radius.zero, bottomRight: Radius.zero)               )),
            ),
          ),
Padding(padding: const EdgeInsets.all(10),
    child: ElevatedButton(onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
    }, child: Text("Sign Up")),
    ),


          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: const Text('Back To Home Page')),
        ],
      ),
    );
  }
}



