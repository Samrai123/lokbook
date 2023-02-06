import 'dart:io';

import 'package:my_second_app/app/network_connectivity.dart';
import 'package:my_second_app/data_source/local_data_source/user_data_source.dart';
import 'package:my_second_app/data_source/remote_data_source/user_data_source.dart';

import '../model/user.dart';

abstract class UserRepository {
  Future<List<User>> getUser();
  Future<int> addAllUser(File? file, User user);
  Future<bool> loginUser(String username, String password);
}

class UserRepositoryImpl extends UserRepository {
  @override
  Future<int> addAllUser(File? file, User user) async {
    bool status = await NetworkConnectivity.isOnline();
    if (status) {
      return UserRemoteDataSource().addUser(file, user);
    } else {
      return UserLocalDataSource().addUser(file, user);
    }
  }

  @override
  Future<List<User>> getUser() async {
    bool status = await NetworkConnectivity.isOnline();
    if (status) {
      return UserRemoteDataSource().getAllUser();
    } else {
      return UserLocalDataSource().getUser();
    }
  }

  @override
  Future<bool> loginUser(String username, String password) async {
    bool status = await NetworkConnectivity.isOnline();
    if (status) {
      return UserRemoteDataSource().loginUser(username, password);
    } else {
      return false;
      // return UserLocalDataSource().loginUser(username, password);
    }
  }
}
