import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: 'Named Routes',
    initialRoute: '/',
    routes: {
      '/': (context) => firstRoute(),
      '/second' :(context) => secondRoute(),
      '/third' : (context) => thirdRoute(),
    },
  ));
}

class firstRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Page'),),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         const Text('First Page', style: TextStyle(fontSize: 30),),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, '/second');
          },
              child:const Text('Second Page')),
         const SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, '/third');
          }, child: const Text('Third Page')),
        ],
      ),
      ),
    );
  }

}

class secondRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text('Second Page'),),
body: Center(
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children:[
    Text('Welcome to Second Page'),
    ElevatedButton(onPressed: (){
      Navigator.pushNamed(context, '/third');
    }, child: Text('Third Page'))
  ],
),
),
   );
  }
}

class thirdRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Third Page'),),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Third Page'),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, '/');
          }, child: Text("GO back to 1st Page"),),
        ],
      ),
    ),
  );
  }

}