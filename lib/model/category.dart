import 'package:my_second_app/model/user.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Category {
  @Id(assignable: true)
  int categoryId;
  String categoryName;

  @Backlink()
  final user = ToMany<User>();
  Category(this.categoryName, {this.categoryId = 0});
}
