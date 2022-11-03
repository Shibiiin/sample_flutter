import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GridCo(),
  ));
}

class GridCo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GRID VIEW COUNT'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.cabin), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'account'),
          BottomNavigationBarItem(icon: Icon(Icons.arrow_back), label: "back"),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        shrinkWrap: true,
        children: List.generate(
          18,
          (index) {
            return Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://cdn.searchenginejournal.com/wp-content/uploads/2022/06/image-search-1600-x-840-px-62c6dc4ff1eee-sej-1520x800.png"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
