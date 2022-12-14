import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Bottomm(),
  ));
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: Bottomm(),
   );
  }

}
class Bottomm extends StatelessWidget {
  void _show(BuildContext ctx){
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 3,
        context: ctx,
        builder: (ctx) => Container(
          padding: EdgeInsets.only(top: 10,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(ctx).viewInsets.bottom + 100),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
               const TextField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  label: Text('Name'),
                ),),
               const TextField(keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Age'),
              ),
             const SizedBox(height: 10),
          ElevatedButton(onPressed: ()
    {
      Navigator.of(ctx).pop();
          }, child:const Text('Submit'))
            ],

          ),
        ),);
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
appBar: AppBar(
  title: Text('Bottom Sheet'),
centerTitle: true,
),
     body: Container(
       child:
           Padding(padding: EdgeInsets.all(50),
           child:
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:const [
           Icon(FontAwesomeIcons.instagram,size: 50,),
           SizedBox(height: 10,),
           Icon(FontAwesomeIcons.instagram,size: 50,),
           SizedBox(height: 10,),
           Icon(FontAwesomeIcons.instagram,size: 50,),
         ],
    )
       ),
     ),
     floatingActionButton: FloatingActionButton(
       child: Icon(Icons.home),
       onPressed: () => _show(context),
     ),

   );

  }
}