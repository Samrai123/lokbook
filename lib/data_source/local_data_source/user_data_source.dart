import '../../helper/objectbox.dart';
import '../../model/user.dart';
import '../../state/objectbox_state.dart';

class UserDataSource {
  ObjectBoxInstance get objectBoxInstance => ObjectBoxState.objectBoxInstance!;

  Future<int> addUser(User user) async {
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
}
