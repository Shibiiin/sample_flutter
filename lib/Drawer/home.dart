import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import '../Hompage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: homepage(),
  ));
}

class homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  String mainPrafilePic =
      'https://media.istockphoto.com/id/1309328823/photo/headshot-portrait-of-smiling-male-employee-in-office.jpg?b=1&s=170667a&w=0&k=20&c=MRMqc79PuLmQfxJ99fTfGqHL07EDHqHLWg0Tb4rPXQc=';
  String otherProfilePic =
      "https://assets-global.website-files.com/5ec7dad2e6f6295a9e2a23dd/6222481c0ad8761618b18e7e_profile-picture.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer'),
        centerTitle: true,
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(),
        child: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Shibin Mohammed'),
                accountEmail: const Text('Shibin123@gmail.com'),
                currentAccountPicture: GestureDetector(
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://assets-global.website-files.com/5ec7dad2e6f6295a9e2a23dd/6222481c0ad8761618b18e7e_profile-picture.jpg"),
                  ),
                  onTap: () => print('Current User'),
                ),
                otherAccountsPictures: const [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80'),
                  )
                ],
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListTile(
                dense: true,
                title: Text('Home'),
                trailing: Icon(Icons.home),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => HomePage(),
                  ));
                },
              ),
              ListTile(
                dense: true,
                title: Text('Account'),
                trailing: Icon(Icons.account_circle),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()));
             /// Quick alert
               QuickAlert.show(
                 context: context,
                 type: QuickAlertType.success,
                 title: 'Success',
                 text: 'Welcome',
               );
                },
              ),
              ListTile(
                dense: true,
                title: Text('Info'),
                trailing: Icon(Icons.info),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()));
                  QuickAlert.show(
                      context: context,
                      type: QuickAlertType.warning,
                  confirmBtnColor: Colors.orange,
                    text: 'Please Check Your Code'
                  );
                  },
              ),
              const Divider(
                height: 10,
                color: Colors.black,
                thickness: 2,
              ),
              ListTile(
                title: Text('Close'),
                trailing: Icon(Icons.close),
                onTap: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Alert Dialog'),
                          content: Text('Do ypu want to close?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => homepage(),
                                    ));
                              },
                              child: Text('Yes'),
                            ),
                            TextButton(onPressed: () {}, child: Text('No')),
                          ],
                        );
                      });
                },
              )
            ],
          ),
        ),
      ),
      body: Center(
        child: (Text(
          'HOME PAGE',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
