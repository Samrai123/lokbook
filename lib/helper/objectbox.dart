import 'package:my_second_app/model/user.dart';

import 'package:path_provider/path_provider.dart';
import '../model/category.dart';
import '../objectbox.g.dart';

class ObjectBoxInstance {
  late final Store _store;
  late final Box<User> _user;
  late final Box<Category> _category;

  //Constructor
  ObjectBoxInstance(this._store) {
    _user = Box<User>(_store);
    _category = Box<Category>(_store);

    insertCategory();
  }
//initialization of objectbox
  static Future<ObjectBoxInstance> init() async {
    var dir = await getApplicationDocumentsDirectory();
    final store = Store(
      getObjectBoxModel(),
      directory: '${dir.path}/user_main',
    );
    return ObjectBoxInstance(store);
  }

////add users
  int addAllUser(User user) {
    return _user.put(user);
  }

  List<User> getAllUser() {
    return _user.getAll();
  }

  // category
  int addCategory(Category category) {
    return _category.put(category);
  }

  List<Category> getAllCategory() {
    return _category.getAll();
  }

  Category? getCategoryByCategoryName(String categoryName) {
    return _category
        .query(Category_.categoryName.equals(categoryName))
        .build()
        .findFirst();
  }

  //login user
  User? loginUser(String username, String password) {
    return _user
        .query(
            User_.username.equals(username) & User_.password.equals(password))
        .build()
        .findFirst();
  }

  void insertCategory() {
    List<Category> lstCategory = getAllCategory();
    if (lstCategory.isEmpty) {
      addCategory(Category('Art'));
      addCategory(Category('Fashion'));
      addCategory(Category('Abstract'));
      addCategory(Category('Wildlife'));
    }
  }
}
