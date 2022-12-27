
import 'package:hive/hive.dart';

import '../models/user_model.dart';

class DBFunctions {
  //Singleton only one constructor
  DBFunctions._internal();

  static DBFunctions instance = DBFunctions._internal();

  /// Factory Constructor
  factory DBFunctions() {
    return instance;
  }
  //Add users
  Future<void> userSignup(UserModel user) async {
    final db = await Hive.openBox<UserModel>('user');
    db.put(user.id, user);
  }

  //getUsers
  Future<List<UserModel>> getUsers() async {
    final db = await Hive.openBox<UserModel>('user');

    return db.values.toList();
  }
}