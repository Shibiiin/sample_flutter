import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Back(),
  ));
}

class Back extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPop() async {
      return await showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text('Exit App'),
              content: const Text('do you want to exit?'),
              actions: [
                ElevatedButton(onPressed: () =>
                    Navigator.of(context).pop(true),
                  child: Text('Yes'),
                ),

                ElevatedButton(onPressed: () =>
                    Navigator.of(context).pop(false),
                  child: Text('No'),),
              ],
            ),
      ) ?? false;     /// if ShowDialoge had returned null , then return false
    }

    return WillPopScope(
        onWillPop: showExitPop,
        child:Scaffold(
          appBar: AppBar(title:const Text('Back Button'),),
          body: const Center(
            child: Text('Text back Button'),
          ),

        ),
    );
  }

}