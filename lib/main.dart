import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Splash(),
  ));
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Scafflod used for edit the body of the app
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.access_time_filled_rounded,
              size: 70,
              color: Colors.blue,
            ),
            Text(
              'Clock',
              style: TextStyle(color: Colors.red, fontSize: 30,  ),
            )
          ],
        ),
      ),
    );
  }
}
