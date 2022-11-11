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
child: Column(
  children: [
    Text('Name: ${Product['name']}',
    style:const TextStyle(fontSize: 50, color: Colors.red),),
    Text('Price ${Product['price'].toString()}',style: const TextStyle(fontSize: 30),),
Text('Description ${Product['description']}'),
   Image(image: NetworkImage('${Product['image']}'),
   height: 170,
   width: double.infinity,

   ),
  ],
),
   ),
 );
  }

}