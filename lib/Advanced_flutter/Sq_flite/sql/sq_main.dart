import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../sql/Sql_helper.dart';

void main() {
  runApp(const MaterialApp(
    home: SQF(),
  ));
}

class SQF extends StatefulWidget {
  const SQF({super.key});

  @override
  State<StatefulWidget> createState() => _SQFState();
}

class _SQFState extends State<SQF> {
  List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;

  /// this function used to fetch all data from the database
  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshJournals();

    /// Loading the diary when the app starts
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  /// this function will triggered when the floating button is pressed
  /// it will also be triggered when we want to update an item.

  void _showForm(int? id) async {

    if (id != null) {
      /// Id == null -> create new item
      /// id != null -> update an existing item
      final existingJournal =
          _journals.firstWhere((element) => element['id'] == id);

      _titleController.text = existingJournal['title'];
      _descriptionController.text = existingJournal['description'];
    }

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        elevation: 5,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(hintText: 'Title'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(hintText: 'Description'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      /// save new journals
                      if (id == null) {
                        await _addItem();
                      }
                      if (id != null) {
                        await _updateItem(id);
                      }

                      /// clear the text fields
                      _titleController.text = '';
                      _descriptionController.text = '';

                      /// close the bottom sheet
                      Navigator.of(context).pop();
                    },
                    child: Text(id == null ? 'Create new' : 'Update'),
                  ),
                ],
              ),
            ));
  }

  /// insert a new journals to the database
  Future<void> _addItem() async {
    await SQLHelper.createItem(
        _titleController.text, _descriptionController.text);
    _refreshJournals();
  }

  /// Udpate an existing journals

  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(
        id, _titleController.text, _descriptionController.text);
    _refreshJournals();
  }

  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Successfully deleted')));
    _refreshJournals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQfLite"),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) => Card(
                color: Colors.orangeAccent,
                margin: const EdgeInsets.all(15),
                child: ListTile(
                  title: Text(_journals[index]['title']),
                  subtitle: Text(_journals[index]['description']),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => _showForm(_journals[index]['id']),
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () => _deleteItem(_journals[index]['id']),
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              itemCount: _journals.length,  ///Length of data from db
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
