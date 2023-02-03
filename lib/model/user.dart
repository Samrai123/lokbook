import 'package:json_annotation/json_annotation.dart';
import 'package:my_second_app/model/category.dart';
import 'package:objectbox/objectbox.dart';
part 'user.g.dart';

@JsonSerializable()
@Entity()
class User {
  @Id(assignable: true)
  int uId;

  @Unique()
  @Index()
  @JsonKey(name: '_id')
  String? userId;
  String? fname;
  String? lname;
  String? image;
  String? email;
  String? username;
  String? password;

  @JsonKey(name: 'category')
  List<Category>? categorys;
  final category = ToMany<Category>();

  User(
      {this.userId,
      this.fname,
      this.lname,
      this.image,
      this.email,
      this.username,
      this.password,
      this.uId = 0});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
