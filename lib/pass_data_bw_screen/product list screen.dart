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
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,

        ),
        children: dummyProducts.map((Product){
          return Stack(
            children: [
             Padding(padding: EdgeInsets.all(50),
              child: Image(image: NetworkImage('${Product['image']}'),
                height: 200,
              width:200,
               ),
              ),
            Container(
              child: (
          Positioned(
            height: 50,
                left: 60,
                bottom: 10,
                child:
              TextButton(
              onPressed: () => Navigator.of(context).pushNamed('single-product', arguments: Product['id']),
              child: Text(Product['name']),),

          )
          ),
              ),
          ],);
        } ).toList(),

      ),
      
      );
  }
}
