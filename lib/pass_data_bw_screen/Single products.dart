import 'package:flutter/material.dart';
import 'package:sample_flutter/pass_data_bw_screen/dummy%20data.dart';

class SingleProductScreen extends StatelessWidget{
  const SingleProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final productId = ModalRoute.of(context)?.settings.arguments;
 final Product = dummyProducts.firstWhere((e) =>e['id']== productId);

 return Scaffold(
   appBar: AppBar(title:
     Text(Product['name']),
   ),
   body: Padding(
      padding:const EdgeInsets.all(20),
child: ListView(
  children: [
    Image(image: NetworkImage('${Product['image']}'),
      height: 170,
      width: double.infinity,
    ),
    Text('${Product['name']}',
    style:const TextStyle(fontSize: 50, color: Colors.red),textAlign: TextAlign.center,),
    const Padding(padding: EdgeInsets.all(30)),
    Text('Price ${Product['price'].toString()}',style:TextStyle(fontSize: 40, backgroundColor: Colors.yellow),textAlign: TextAlign.center,),
    const Padding(padding: EdgeInsets.all(30)),
Text('Description ${Product['description']}',style: TextStyle(fontSize: 30, background:  Paint()..color = Colors.blue),textAlign: TextAlign.center,),
    const Padding(padding: EdgeInsets.all(30)),

  ],
),
   ),
 );
  }

}