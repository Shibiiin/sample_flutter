import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BottomBar(),
  ));
}

class BottomBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectindex = 0;

  List bodys = const <Widget>[
    Card(
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Text('Home'),
      ),
    ),
    Card(
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Text('Search'),
      ),
    ),
    Card(
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Text('Activity'),
      ),
    ),
    Card(
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Text(
          'Account',
          style: TextStyle(fontSize: 50),
        ),
      ),
    ),
  ];

  void onitemtapped(int index) {
    setState(() {
      selectindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Bar'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Activity'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account')
        ],
        currentIndex: selectindex,
        onTap: onitemtapped,
      ),
      body: Center(
        child: bodys.elementAt(selectindex),
      ),
    );
  }
}
