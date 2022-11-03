import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

void main() {
  runApp(MaterialApp(home: StaggeredGrid(),));
}

class StaggeredGrid extends StatelessWidget {

final List<StaggeredTile> _cardTile = const <StaggeredTile>[

  StaggeredTile.count(2,4),
  StaggeredTile.count(2,2),
  StaggeredTile.count(2,2),
  StaggeredTile.count(2,3),
  StaggeredTile.count(2,2),
  StaggeredTile.count(2,3),
  StaggeredTile.count(2,1),
  StaggeredTile.count(2,4),
  StaggeredTile.count(2,3),
];

final List<Widget> _listTile = <Widget>[
  BackGroundTile(backgroundColor: Colors.cyan, iconData: Icons.home),
  BackGroundTile(backgroundColor: Colors.grey, iconData: Icons.home),
  BackGroundTile(backgroundColor: Colors.red, iconData: Icons.accessibility),
  BackGroundTile(backgroundColor: Colors.black, iconData: Icons.ac_unit),
  BackGroundTile(backgroundColor: Colors.grey, iconData: Icons.home),
  BackGroundTile(backgroundColor: Colors.yellow, iconData: Icons.favorite),
  BackGroundTile(backgroundColor: Colors.blue, iconData: Icons.home),
  BackGroundTile(backgroundColor: Colors.grey, iconData: Icons.home),
  BackGroundTile(backgroundColor: Colors.grey, iconData: Icons.home),
  BackGroundTile(backgroundColor: Colors.green, iconData: Icons.favorite),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Container(
  child: StaggeredGridView.count(
     crossAxisCount: 5,
      staggeredTiles: _cardTile,
      mainAxisSpacing: 4,
  children: _listTile,
  ),
),
    );
  }
}

class BackGroundTile extends StatelessWidget {

  final Color? backgroundColor;
  final IconData iconData;

  BackGroundTile({this.backgroundColor, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Icon(iconData, color: Colors.white,),
    );
  }

}