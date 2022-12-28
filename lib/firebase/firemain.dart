import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart'as path;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: Fire(),
  ));
}

class Fire extends StatefulWidget {
  @override
  State<Fire> createState() => _FireState();
}

class _FireState extends State<Fire> {
  FirebaseStorage storage = FirebaseStorage.instance;

  /// select an image from the gallery or take a picture with the camera
  /// then upload to firebase storage

  Future<void> _upload(String inputSource) async {

    final picker = ImagePicker();
    XFile? pickedImage;

    try {
      pickedImage = await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920);

      final String fileName = path.basename(pickedImage!.path);
      File imageFile = File(pickedImage.path);

      try {
        // Uploading the selected image with some custom meta data
        await storage.ref(fileName).putFile(
            imageFile,
            SettableMetadata(
                customMetadata: {
                  'uploaded_by': 'A bad guy',
                  'description': 'Some description...'
                }));

        // Refresh the UI
        setState(() {});
      } on FirebaseException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  Future<List<Map<String, dynamic>>> _loadImages() async {
    List<Map<String, dynamic>> files = [];

    final ListResult result = await storage.ref().list();
    final List<Reference> allfiles = result.items;

    await Future.forEach<Reference>(allfiles, (file) async {
      final String fileUrl = await file.getDownloadURL();
      final FullMetadata fileMeta = await file.getMetadata();

      files.add({
        "url": fileUrl,
        "path": file.fullPath,
        "upload_by": fileMeta.customMetadata?['uploaded_by'] ?? 'Nobody',
        "description":
        fileMeta.customMetadata?['description'] ?? 'No description'
      });
    });
    return files;
  }

  ///To Delete the Images
  Future<void> _delete(String ref) async {
    await storage.ref(ref).delete();
    setState(() {
      /// automatically rebuilt the UI
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _upload('camera'),
                  icon: Icon(Icons.camera),
                  label: Text('Camera'),
                ),
                ElevatedButton.icon(
                  onPressed: () => _upload('gallery'),
                  icon: Icon(Icons.library_add),
                  label: Text('Gallery'),
                ),
              ],
            ),
            Expanded(
                child: FutureBuilder(
                  future: _loadImages(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            final Map<String, dynamic> image =
                            snapshot.data![index];
                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: ListTile(
                                dense: false,
                                leading: Image.network(image['url']),
                                title: Text(image['uplaod_by']),
                                subtitle: Text(image['description']),
                                trailing: IconButton(
                                    onPressed: () => _delete(image['path']),
                                    icon: const Icon(Icons.delete)),
                              ),
                            );
                          });
                    }
                  },
                ))
          ],
        ),
      ),
    );
  }
}

