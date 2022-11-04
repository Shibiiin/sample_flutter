import 'package:flutter/material.dart';
import 'package:sample_flutter/Stack.dart';
import 'package:sample_flutter/Table.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TabBarEx(),
  ));
}

class TabBarEx extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
      appBar: AppBar(title: Text('Tab Bar '),
      centerTitle: true,
      actions:  [
      const  Icon(Icons.search),
        PopupMenuButton(
            itemBuilder: (context){
              return const [
                PopupMenuItem(
                    child: Text('Account'),),
                PopupMenuItem(child: Text('Settings')),
                PopupMenuItem(child: Text('New Boardcast')),
              ];
            }),

      ],
      bottom: const TabBar(
        tabs:  [
          Tab(
            icon: Icon(Icons.home,),
            text: 'Chat',
          ),
          Tab(
            icon: Icon(Icons.accessibility),
            text: 'Status',
          ),
          Tab(
              icon: Icon(Icons.call),
            text: 'Call',
          ),
        ],
      ),
      ),
        body: TabBarView(
          children: [
            Tables(),
           const Center(
              child: Icon(Icons.favorite),
            ),
            Container(
              child: Text('Call Page'),
              color: Colors.red,
            ),
                      ],
        ),

    ),



    );
  }

}