import 'package:json_annotation/json_annotation.dart';
import 'package:my_second_app/model/category.dart';
import 'package:my_second_app/model/user.dart';
import 'package:objectbox/objectbox.dart';
part 'visual.g.dart';

@JsonSerializable()
@Entity()
class Visual {
  @Id(assignable: true)
  int vId;

  @Unique()
  @Index()
  @JsonKey(name: '_id')
  String? visualId;
  String? title;
  String? description;
  String? image;

  @JsonKey(name: 'category')
  List<Category>? categorys;
  final category = ToMany<Category>();
  Visual(
      {this.visualId, this.description, this.title, this.image, this.vId = 0});

  factory Visual.fromJson(Map<String, dynamic> json) => _$VisualFromJson(json);
  Map<String, dynamic> toJson() => _$VisualToJson(this);
}
