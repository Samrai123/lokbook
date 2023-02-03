import 'dart:io';

import 'package:my_second_app/data_source/local_data_source/user_data_source.dart';

import '../model/user.dart';

abstract class UserRepository {
  Future<List<User>> getUser();
  Future<int> addAllUser(File? file, User user);
  Future<User?> loginUser(String username, String password);
}

class UserRepositoryImpl extends UserRepository {
  @override
  Future<int> addAllUser(File? file, User user) async {
    return UserLocalDataSource().addUser(file, user);
  }

  @override
  Future<List<User>> getUser() {
    return UserLocalDataSource().getUser();
  }

  @override
  Future<User?> loginUser(String username, String password) {
    return UserLocalDataSource().loginUser(username, password);
  }
}
