import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_flutter/grid%20view.dart';

void main(){
  runApp(MaterialApp(home: CustomGri(),));
}

class CustomGri extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
body: GridView.custom(
    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 5,
),
    childrenDelegate: SliverChildBuilderDelegate((BuildContext,  index)
    {
      return Image.asset(images[index],
        height: 70,
        width: 70,
        fit: BoxFit.cover,);
    },
      childCount: 8,
    ),
  padding: EdgeInsets.all(20),
  shrinkWrap: true,
),



   );
  }

}