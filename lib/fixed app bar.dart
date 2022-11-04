import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FixedAppBar(),
  ));
}

class FixedAppBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FixedAppBarState();
}

class _FixedAppBarState extends State <FixedAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: false,
            snap: true,
            title: Text('Custom AppBar'),
            actions: [
              IconButton(onPressed: (){}, icon:const Icon(Icons.add_shopping_cart),),
              IconButton(onPressed: (){}, icon: const Icon(Icons.favorite),),
            ],
            bottom: AppBar(
              title: Container(
                width: double.infinity,
                height: 40,
                color: Colors.white,
                child:const Center(
                  child: TextField(
                    decoration: (
                    InputDecoration(
                      hintText: 'Search For something',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.camera_enhance))
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(
                [
                  const SizedBox(
                    height: 500,
                    child: Center(
                      child: Text(' this is a Container'),
                    ),
                  ),
                  Container(
                    height: 1000,
                    color: Colors.red,
                  ),
                ])
          ),
        ],
      ),
    );
  }
}