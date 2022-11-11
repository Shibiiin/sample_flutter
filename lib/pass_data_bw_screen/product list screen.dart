import 'package:flutter/material.dart';
import 'package:sample_flutter/pass_data_bw_screen/dummy%20data.dart';

class ProductList extends StatelessWidget{

  // void _goToSingle(context,productId){
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List'),
      centerTitle: true),
      body: ListView(
        children: dummyProducts.map((Product){
          return TextButton(
              onPressed: () => Navigator.of(context).pushNamed('single-product', arguments: Product['id']),
              child: Text(Product['name']));
        } ).toList(),

      ),
      );
  }
}
