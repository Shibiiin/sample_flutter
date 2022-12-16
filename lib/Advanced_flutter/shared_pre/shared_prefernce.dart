import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mydash.dart';

/// small amount of memory storage = Shared Prefernces

void main() {
  runApp(MaterialApp(
    home: SharedP(),
  ));
}

class SharedP extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SharedPState();
}

class _SharedPState extends State <SharedP> {

  final username_controller = TextEditingController();
  final password_controller = TextEditingController();

  late SharedPreferences logindata;
  late bool newuser;


  @override
  void initState() {
    check_if_already_login();
  }

  void check_if_already_login() async {
    logindata /* object of Shared Preference */ =
    await SharedPreferences.getInstance();
    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Mydash()));
    }
  }


  @override
  void dispose() {
    username_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Shared Preference'),
        centerTitle: true,
      ),
      body: Center(
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text('Login Page',
              style: TextStyle(
                fontSize: 25,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),),
            Text("To show Example of Shared Preference"),
            Padding(padding: EdgeInsets.all(20),
              child:
              TextField(
                controller: username_controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'username',
                ),
              ),),
            Padding(padding: EdgeInsets.all(20),
              child: TextField(
                // obscuringCharacter: '****',
                controller: password_controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'password',
                ),
              ),),
            ElevatedButton(onPressed: () {
              String username = username_controller.text;
              String password = password_controller.text;

              if (username != '' && password != '') {
                print('Successfull');

                logindata.setBool('login', false);
                logindata.setString('username', username);
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Mydash()));
              }
            },
              child: Text('login'),
            ),

          ],
        ),
      ),
    );
  }
}

