import 'package:flutter/material.dart';
import 'package:sample_flutter/home.dart';

class LoginValidation extends StatefulWidget {
  @override
  State<LoginValidation> createState() => _LoginValidation(); {

  }



  var fromkey = GlobalKey<FormState>();
bool viewvalue = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Login Validation ",
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
        ),
      ),
      body: Form(
        key: fromkey,
        child: ListView(
        //children: Column(
        children: [

/// Login
          const Padding(
            padding: EdgeInsets.only(top: 30, right: 120, left: 160),
            child: Text(
              "Login",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ),

          /// UserName Text field
           Padding(padding: EdgeInsets.all(20),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.co_present, color: Colors.black,size: 30,),
              helperText: ('Enter your Email address'),
                  labelStyle: TextStyle(fontSize: 19, color: Colors.blueAccent),

                  labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.zero, bottomLeft: Radius.zero, bottomRight: Radius.zero)               )),
            validator:(text) {
              if (text!.isEmpty || !(text.contains('@gmail.com'))) {
                return 'Enter a Valid Email address';
              }
              else {
                return null;
              }
            },
            ),
          ),

          /// Password Text field
           Padding(padding: EdgeInsets.all(20),
            child: TextFormField(
              obscuringCharacter: "*",
              obscureText: viewvalue,
              decoration:  InputDecoration(
                 suffixIcon: IconButton(
                     onPressed: (){
                   setState (() {

                   }
                 }),

                  prefixIcon: Icon(Icons.password, color: Colors.red,size: 30,),
                  helperText: ('Enter your Password'),
                  labelStyle: TextStyle(fontSize: 19, color: Colors.blueAccent),
                  labelText: 'Password',
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.zero, bottomLeft: Radius.zero, bottomRight: Radius.zero)               )),
           validator:(text){
                if(text!.length<7 || text.isEmpty){
return 'Password should be greater than 7 or Must be filled';
                }
                  },
            ),
          ),
Padding(padding: const EdgeInsets.all(10),
    child: ElevatedButton(onPressed: () {
      final isValid = fromkey.currentState!.validate();
  if(isValid){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
  }
    }, child: Text("Sign Up")),
    ),


          TextButton(
              onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
              },
              child: const Text('Back To Home Page')),
        ],
    ),
      ),
    );
  }
}



