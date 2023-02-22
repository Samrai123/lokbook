import 'package:my_second_app/model/user.dart';
import 'package:my_second_app/model/visual.dart';
import 'package:objectbox/objectbox.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';

@JsonSerializable()
@Entity()
class Category {
  @Id(assignable: true)
  int id;
  @Unique()
  @Index()
  @JsonKey(name: '_id')
  String categoryId;
  String categoryName;
  @Backlink()
  final user = ToMany<User>();
  final visual = ToMany<Visual>();
  Category(this.categoryId, this.categoryName, {this.id = 0});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
