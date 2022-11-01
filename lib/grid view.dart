import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GridEx(),
  ));
}
var images=[
'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',


];


class GridEx extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text('Grid View'),),
     body: GridView.builder(
       itemCount: images.length,
         gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 2,
           mainAxisExtent: 150,
           crossAxisSpacing: 20,

         ),

         itemBuilder: (context, index){
       return Image.network(images[index]);
   },
       padding: EdgeInsets.all(20),
       shrinkWrap: true,
),
   );
  }

}