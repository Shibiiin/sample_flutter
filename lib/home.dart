import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:
        Text(
          'Welcome',
          style: TextStyle(
              color: Colors.red, fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
