import 'dart:math';

class LoginResponse {
  bool? success;
  String? message;
  String? token;
  String? email;
  String? username;
  String? image;

  LoginResponse({this.success, this.message, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    token = json['token'];
    email = json['email'];
    username = json['username'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['token'] = token;
    data['email'] = email;
    data['username'] = username;
    data['image'] = image;
    return data;
  }
}
