import 'package:json_annotation/json_annotation.dart';
import 'package:my_second_app/model/visual.dart';
part 'visual_response.g.dart';

@JsonSerializable()
class VisualResponse {
  bool? success;
  String? message;
  List<Visual>? data;
  VisualResponse({this.success, this.message, this.data});

  factory VisualResponse.fromJson(Map<String, dynamic> json) =>
      _$VisualResponseFromJson(json);
  Map<String, dynamic> toJson() => _$VisualResponseToJson(this);
}
