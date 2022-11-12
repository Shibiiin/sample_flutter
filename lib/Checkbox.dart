import 'package:flutter/material.dart';

void main(){
runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: CheckBoxx(),
));
}

class CheckBoxx extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _CheckBoxxState();
}

class _CheckBoxxState extends State<CheckBoxx> {

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        children: <Widget>[
          Checkbox(
              value: isChecked,
              onChanged: (bool? value){

                setState(() {
                  isChecked = value!;
                });
              }

          ),
        ],
      ),
    );
  }

}