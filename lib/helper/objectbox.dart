import 'package:my_second_app/model/user.dart';
import 'package:path_provider/path_provider.dart';
import '../objectbox.g.dart';

class ObjectBoxInstance {
  late final Store _store;
  late final Box<User> _user;
  //Constructor
  ObjectBoxInstance(this._store) {
    _user = Box<User>(_store);
  }
//initialization of objectbox
  static Future<ObjectBoxInstance> init() async {
    var dir = await getApplicationDocumentsDirectory();
    final store = Store(
      getObjectBoxModel(),
      directory: '${dir.path}/user_info',
    );
    return ObjectBoxInstance(store);
  }

  int addAllUser(User user) {
    return _user.put(user);
  }

  List<User> getAllUser() {
    return _user.getAll();
  }
}
