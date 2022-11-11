import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Sliderr(),
  ));
}

class Sliderr extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _SliderrState();
}

class _SliderrState extends State<Sliderr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel SLider'),
        centerTitle: true,
      ),
      body:CarouselSlider(
        items: [
        
      ],







      ),


    );
  }
}