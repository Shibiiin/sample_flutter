import 'package:flutter/material.dart';
import 'package:sample_flutter/Hompage.dart';
import 'package:sample_flutter/Login%20with%20validation.dart';

class RegPage extends StatelessWidget {

var formkey = GlobalKey<FormState>();
TextEditingController pass =TextEditingController();
TextEditingController cpass = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              "Registration Page",
              style: TextStyle(fontSize: 30),
            ),
            centerTitle: true,
          ),
        ),
        body: SingleChildScrollView(
          key: formkey,
          child: Column(
            children: [
              /// Login Page Text
              const Padding(
                padding: EdgeInsets.only(top: 150),
                child: Text(
                  "Registration Page",
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
                  controller: pass,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.red,
                        size: 30,
                      ),
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
              /// Confirm Password Text field
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: cpass,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.red,
                        size: 30,
                      ),
                     labelStyle:
                      TextStyle(fontSize: 19, color: Colors.blueAccent),
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.zero,
                              bottomLeft: Radius.zero,
                              bottomRight: Radius.zero))),
                  validator: (text) {
                    if (text!.length < 7 || text.isEmpty ) {
                      return 'Password should be greater than 7 or Must be filled';
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.done,          /// text-action input used to go next text box when "Enter" button CLicked
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                    onPressed: () {
                      final isValid = formkey.currentState!.validate();
                      if (isValid) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const HomePage()));
                      }
                      },

                    child: Text("Register ")
                    ),
              ),

            ],
          ),
        ));
  }
}
