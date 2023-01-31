import 'package:my_second_app/data_source/local_data_source/category_data_source.dart';
import 'package:my_second_app/model/category.dart';

abstract class CategoryRepository {
  Future<int> addCategory(Category category);
  Future<List<Category>> getAllCategory();
  Future<Category?> getCategoryByCategoryName(String categoryName);
}

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<int> addCategory(Category category) {
    return CategoryLocalDataSource().addCategory(category);
  }

  @override
  Future<List<Category>> getAllCategory() {
    return CategoryLocalDataSource().getAllCategory();
  }

  @override
  Future<Category?> getCategoryByCategoryName(String categoryName) {
    return CategoryLocalDataSource().getCategoryByCategoryName(categoryName);
  }
}
