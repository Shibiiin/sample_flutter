import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Sliderr(),
  ));
}

class Sliderr extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SliderrState();
}

class _SliderrState extends State<Sliderr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel SLider'),
        centerTitle: true,
      ),
      body: ListView(
          children: [
      CarouselSlider(
      items: [
      /// 1st image of the slider
      Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: NetworkImage(
              'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png'),
          fit: BoxFit.cover,
        ),
      ),
    ),
    /// 2nd image of the slider
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
    /// 3rd image of the slide
    Container(
    height: 350,
    margin: const EdgeInsets.all(5.0),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    image: const DecorationImage(
    image: NetworkImage('https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png'),
    fit: BoxFit.cover,
    ),
    ),
    ),
    ],
    options: CarouselOptions(
    height: 200,
    scrollDirection: Axis.vertical,
    enlargeCenterPage: true,
    autoPlay: false,
      autoPlayAnimationDuration: Duration(seconds: 3),
      autoPlayCurve: Curves.easeOutBack,
      viewportFraction: 0.8,
    )
    ),
            Padding(padding: EdgeInsets.all(50),
            child:
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(FontAwesomeIcons.facebook, size: 50,color: Colors.blue,),
                      SizedBox(width: 50,),
                      Icon(FontAwesomeIcons.instagram, size: 50,color: Colors.red,),
                      SizedBox(width: 50,),
                      Icon(FontAwesomeIcons.twitter, size: 50,color: Colors.blue,),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children:[
                  Padding(padding: EdgeInsets.all(15),
                  child:
                  Container(
                    child: Text('Carousel SLider', style: TextStyle(fontSize: 20),),
    ),
                  ),
    ]
                  ),
                ],
              ),)
    ],
    ),
    );
  }
}