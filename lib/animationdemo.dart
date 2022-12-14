import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main(){
  runApp(MaterialApp(
    home: Anii(),
  ));
}

class Anii extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _AniiState();
}

/// TickerProviderStateMixin=> Monitoring of Animation State Change update on our screen.
/// With is used due to Mixin.
class _AniiState extends State with TickerProviderStateMixin {

  late AnimationController animationController;

  @override
  void initState(){
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: animationController,
        builder: (BuildContext context, Widget? child){
            return Transform.rotate(
          angle: animationController.value*8,
            child: const Center(
              child: Icon(FontAwesomeIcons.rotate, size: 50,),
            ),
            );
        }

      ),
    );
  }

}