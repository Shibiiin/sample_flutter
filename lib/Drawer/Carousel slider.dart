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
      body:ListView(
        children: [
          CarouselSlider(
              items: [
                Container(
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: NetworkImage('https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],

              options: CarouselOptions(
                height: 20,
                enlargeCenterPage:
              ))
        
      ],







      ),


    );
  }
}