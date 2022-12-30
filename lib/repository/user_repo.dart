import 'package:my_second_app/data_source/local_data_source/user_data_source.dart';

import '../model/user.dart';

abstract class UserRepository {
  Future<List<User>> getUser();
  Future<int> addAllUser(User user);
}

class UserRepositoryImpl extends UserRepository {
  @override
  Future<int> addAllUser(User user) {
    return UserDataSource().addUser(user);
  }

  @override
  Future<List<User>> getUser() {
    return UserDataSource().getUser();
  }
}
