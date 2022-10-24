import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              "Login Page",
              style: TextStyle(fontSize: 30),
            ),
            centerTitle: true,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// Login Page Text
              const Padding(
                padding: EdgeInsets.only(top: 150),
                child: Text(
                  "LOGIN PAGE",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
              ),

              /// Textbox
              const Padding(
                padding: EdgeInsets.all(25.0),
                child: TextField(
                  decoration: InputDecoration(
                      suffix: Icon(Icons.account_circle_outlined, size: 15),
                      label: Text("Username"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      )),
                ),
              ),

              ///Textbox
              const SizedBox(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextField(
                    obscuringCharacter: "*",
                    obscureText: true,
                    decoration: InputDecoration(
                        suffix: Icon(
                          Icons.account_circle,
                          size: 15,
                        ),
                        label: Text("Password"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        )),
                  ),
                ),
              ),

              ///Login button
              Padding(
                padding: const EdgeInsets.all(20.30),
                child: ElevatedButton(onPressed: () {}, child: Text("login")),
              ),

              /// last user
              TextButton(
                  onPressed: () {}, child: Text("Not a User?,Register Here"))
            ],
          ),
        ));
  }
}
