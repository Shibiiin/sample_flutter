import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Splash(),
  ));
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Scafflod used for edit the body of the app
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.freepik.com%2Ffree-photos-vectors%2Fbackground&psig=AOvVaw2YuDgbZnc9l4gL_H3emG43&ust=1666628823989000&source=images&cd=vfe&ved=2ahUKEwiisr2p4vb6AhVgUWwGHSeuDtsQjRx6BAgAEAw"))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage("assets/images/fluttericon.png"),
              height: 100,
              width: 100,
            ),
            //Image.asset('assets/images/fluttericon.png'),
            Text(
              'Flutter',
              style: TextStyle(
                color: Colors.red,
                fontSize: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
