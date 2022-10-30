import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample_flutter/Hompage.dart';
import 'package:sample_flutter/registration.dart';

class LoginValidation extends StatelessWidget {
  var fromkey = GlobalKey<FormState>();
  bool viewvalue = true;

  LoginValidation({super.key});

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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ),

            /// UserName Text field
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.co_present,
                      color: Colors.black,
                      size: 30,
                    ),
                    helperText: ('Enter your Email address'),
                    labelStyle:
                        TextStyle(fontSize: 19, color: Colors.blueAccent),
                    labelText: 'Username',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.zero,
                            bottomLeft: Radius.zero,
                            bottomRight: Radius.zero))),
                validator: (text) {
                  if (text!.isEmpty ) {
                    return 'Enter a Valid Email address';
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.next,
              ),
            ),

            /// Password Text field
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                obscuringCharacter: "*",
                obscureText: viewvalue,
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.password,
                      color: Colors.red,
                      size: 30,
                    ),
                    helperText: ('Enter your Password'),
                    labelStyle:
                        TextStyle(fontSize: 19, color: Colors.blueAccent),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.zero,
                            bottomLeft: Radius.zero,
                            bottomRight: Radius.zero))),
                validator: (text) {
                  if (text!.length < 7 || text.isEmpty) {
                    return 'Password should be greater than 7 or Must be filled';
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.done,          /// textaction input used to go next text box when "Enter" button CLicked
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    final isValid = fromkey.currentState!.validate();
                    if (isValid) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const HomePage()));
                    }
                    else{
                      Fluttertoast.showToast(
                          msg: "This is Center Short Toast",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }
                  },
                  child: Text("Login In")),
            ),

            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegPage()));
                },
                child: const Text('Back To Home Page')),
          ],
        ),
      ),
    );
  }
}
