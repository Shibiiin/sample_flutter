
import 'package:flutter/material.dart';
import 'package:sample_flutter/registration.dart';

void main()
{
  return runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
home: HomePage(),
  ));
}
class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME PAGE'),
      ),
      body: ListView(
    children:   [

      const Center(child: Text('List of Fruits', style: TextStyle(fontSize: 30),)),
     ListTile(title: const Text('APPLE',style: TextStyle(fontSize: 30),),
     subtitle: const Text('Next icon At last right side. using icon in trailing',style: TextStyle(fontSize: 20),),
     leading: Image.asset("assets/images/user.png",height: 150,width: 75),
     trailing: IconButton(onPressed: () {
       Navigator.push(context, MaterialPageRoute(builder: (context)=> RegPage()));
     }, icon:const Icon(Icons.navigate_next, size: 35,color: Colors.red,),)
     ),
const SizedBox(height: 20,),

     const ListTile(title: Text('Person', style: TextStyle(fontSize: 25),),
     subtitle: Text("Circle Image using Circle Avatar in leading ", style: TextStyle(fontSize: 20),),
       leading: CircleAvatar(backgroundImage: NetworkImage(
         "https://static.remove.bg/remove-bg-web/ea3c274e1b7f6fbbfe93fad8b2b13d7ef352f09c/assets/start-1abfb4fe2980eabfbbaaa4365a0692539f7cd2725f324f904565a9a744f8e214.jpg"
       ,scale: 35),
     radius: 50,),
       trailing: Icon(Icons.navigate_next,size: 35,color: Colors.red,),
     ),

      const SizedBox(height: 20,),
      Card(
     child: ListTile(title: const Text('GRAPE',),
     subtitle: const Text('this have card shape on it Row icons using Wrap', style: TextStyle(fontSize: 20),),
     leading: const CircleAvatar(backgroundImage: NetworkImage( "https://static.remove.bg/remove-bg-web/ea3c274e1b7f6fbbfe93fad8b2b13d7ef352f09c/assets/start-1abfb4fe2980eabfbbaaa4365a0692539f7cd2725f324f904565a9a744f8e214.jpg"
     ),
     ),
       trailing: Wrap(
         children:const [
           Icon(Icons.cabin, color: Colors.red,),
           SizedBox(width: 35,),
           Icon(Icons.cable_rounded,color: Colors.blue,),
         ],
       ),
     ),
     ),
      const SizedBox(height: 20,),
     Card(
     child: ListTile(title: const Text('ANAR',style: TextStyle(fontSize: 35),),
leading: Row(
  children: [
    Image.asset("assets/images/fluttericon.png"),
    SizedBox(width: 45,),
      ],
),
     ),

     ),
    ],
        ),
    );
  }


}