import 'dart:io';

import '../../helper/objectbox.dart';
import '../../model/user.dart';
import '../../state/objectbox_state.dart';

class UserLocalDataSource {
  ObjectBoxInstance get objectBoxInstance => ObjectBoxState.objectBoxInstance!;

  Future<int> addUser(File? file, User user) async {
    try {
      return objectBoxInstance.addAllUser(user);
    } catch (e) {
      return Future.value(0);
    }
  }

  Future<List<User>> getUser() {
    try {
      return Future.value(objectBoxInstance.getAllUser());
    } catch (e) {
      throw Exception('Error in getting all user');
    }
  }

  Future<bool> loginUser(String username, String password) async {
    try {
      if (objectBoxInstance.loginUser(username, password) != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('Error occured : ${e.toString()}');
    }
  }
}
