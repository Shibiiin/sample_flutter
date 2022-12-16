import 'package:flutter/material.dart';
import 'package:sample_flutter/Advanced_flutter/shared_pre/shared_prefernce.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mydash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Mydashtate();
}


class _Mydashtate extends State <Mydash> {

  late SharedPreferences logindata;
  late String username;

  @override
  void initState() {
    initial();
  }


  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Text(
          'Welcome $username',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
          ElevatedButton(onPressed: (){
            logindata.setBool('login', true);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SharedP()));
          }, child: Text('Back to login'))
        ],
        ),
      ),
    );
  }
}
