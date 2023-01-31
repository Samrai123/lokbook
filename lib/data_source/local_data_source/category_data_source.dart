import 'package:my_second_app/helper/objectbox.dart';
import 'package:my_second_app/model/category.dart';
import 'package:my_second_app/state/objectbox_state.dart';

class CategoryLocalDataSource {
  ObjectBoxInstance get objectBoxInstance => ObjectBoxState.objectBoxInstance!;

  Future<int> addCategory(Category category) async {
    try {
      return objectBoxInstance.addCategory(category);
    } catch (e) {
      return 0;
    }
  }

  Future<List<Category>> getAllCategory() async {
    try {
      return objectBoxInstance.getAllCategory();
    } catch (e) {
      return [];
    }
  }

  Future<Category?> getCategoryByCategoryName(String categoryName) async {
    try {
      return objectBoxInstance.getCategoryByCategoryName(categoryName);
    } catch (e) {
      return null;
    }
  }
}
