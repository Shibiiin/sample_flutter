import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {

  /// opening a box
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('shopping');

  runApp(const MaterialApp(
    home: Hiive(),
    debugShowCheckedModeBanner: false,
  ));
}

class Hiive extends StatefulWidget{
  const Hiive({super.key});

  @override
  State<StatefulWidget> createState() => _HiiveState();
}

class _HiiveState extends State<Hiive> {
  List<Map<String, dynamic>> _items=[];
  final _shopping = Hive.box('shopping');

  @override
  void initState(){
    super.initState();
    _refreshItems();    /// Load data when app starts
  }

  /// Get all items from the database
  void _refreshItems(){
    final data = _shopping.keys.map((key){
      final value = _shopping.get(key);
      return {"key": key, "name": value['name'], "quantity": value['quantity']};
    }).toList();

    setState(() {
      _items = data.reversed.toList();
      /// We use "reversed to sort items in order from the latest to the oldest
    });
  }

  /// Create new items
  Future<void> _createItem(Map<String, dynamic> newItem) async {
    await _shopping.add(newItem);
    _refreshItems(); // update the UI
  }

  // Retrieve a single item from the database by using its key
  // Our app won't use this function but I put it here for your reference
  Map<String, dynamic> _readItem(int key) {
    final item = _shopping.get(key);
    return item;
  }

  // Update a single item
  Future<void> _updateItem(int itemKey, Map<String, dynamic> item) async {
    await _shopping.put(itemKey, item);
    _refreshItems(); // Update the UI
  }

  // Delete a single item
  Future<void> _deleteItem(int itemKey) async {
    await _shopping.delete(itemKey);
    _refreshItems(); // update the UI

    // Display a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An item has been deleted')));
  }

  // TextFields' controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void _showForm(BuildContext ctx, int? itemKey) async {
    // itemKey == null -> create new item
    // itemKey != null -> update an existing item

    if (itemKey != null) {
      final existingItem =
      _items.firstWhere((element) => element['key'] == itemKey);
      _nameController.text = existingItem['name'];
      _quantityController.text = existingItem['quantity'];
    }

    showModalBottomSheet(
        context: ctx,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(ctx).viewInsets.bottom,
              top: 15,
              left: 15,
              right: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(hintText: 'Name'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Quantity'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  // Save new item
                  if (itemKey == null) {
                    _createItem({
                      "name": _nameController.text,
                      "quantity": _quantityController.text
                    });
                  }
                  // update an existing item
                  if (itemKey != null) {
                    _updateItem(itemKey, {
                      'name': _nameController.text.trim(),
                      'quantity': _quantityController.text.trim()
                    });
                  }

                  // Clear the text fields
                  _nameController.text = '';
                  _quantityController.text = '';

                  Navigator.of(context).pop(); // Close the bottom sheet
                },
                child: Text(itemKey == null ? 'Create New' : 'Update'),
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HiveDB'),
      ),
      body: _items.isEmpty
          ? const Center(
        child: Text(
          'No Data',
          style: TextStyle(fontSize: 30),
        ),
      )
          : ListView.builder(
        // the list of items
          itemCount: _items.length,
          itemBuilder: (_, index) {
            final currentItem = _items[index];
            return Card(
              color: Colors.blue,
              margin: const EdgeInsets.all(10),
              elevation: 3,
              child: ListTile(
                  title: Text(currentItem['name']),
                  subtitle: Text(currentItem['quantity'].toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Edit button
                      IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () =>
                              _showForm(context, currentItem['key'])),
                      // Delete button
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteItem(currentItem['key']),
                      ),
                    ],
                  )),
            );
          }),
      // Add new item button
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showForm(context, null),
        child: const Icon(Icons.add),
      ),
    );
  }
}
