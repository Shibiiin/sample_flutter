import 'package:flutter/material.dart';

import 'Screens/loginForm.dart';
import 'Screens/signupForm.dart';

void main() {
  runApp(const MaterialApp(
    home: LoginSQ(),
    debugShowCheckedModeBanner: false,
  ));
}

class LoginSQ extends StatefulWidget {
  const LoginSQ({super.key});

  @override
  State<StatefulWidget> createState() => _LoginSQState();
}

var formkey = GlobalKey<FormState>();
//bool viewvalue = true;

class _LoginSQState extends State<LoginSQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text('LOGIN AND SIGNUP'),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: ListView(
          children: [
            SizedBox(height: 50,),
            const Text('Hello There !',
              style: TextStyle(
                  fontSize: 50, fontFamily: 'Raleway', color: Colors.blue,
                  fontWeight: FontWeight.bold), textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.only(left: 50, bottom: 75),
              child: Text(
                'Automatic identity verification which enable \n \t \t \t \t \t \t  you to verify your identity',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.black38
                ),),
            ),
            Image.network(
              'https://ouch-cdn2.icons8.com/JoGv42xGg7mhJR1FwADWNMo5Qc3wRCJhwWk5IfHH5g8/rs:fit:512:384/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvODgz/LzIzOWRmMzBhLTc2/M2ItNDY1MC1hNzU0/LTAxMWNkMmU4NWE0/ZS5wbmc.png',
              alignment: Alignment.center,
              height: 255,
              width: 150,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 90, right: 30, left: 30),
                child: ElevatedButton(onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginForm()));
                },
                    child: Text('Login'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder
                          (borderRadius: BorderRadius.circular(15.0))
                        )
                    )
                )
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20, right: 30, left: 30),
                child: ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpForm()));
                }, child: Text('Sign Up'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder
                          (borderRadius: BorderRadius.circular(15.0))
                        )
                    )
                )
            ),
          ],
        ),
      ),
    );
  }
}