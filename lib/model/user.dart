import 'package:flutter/foundation.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  @Id(assignable: true)
  int userId;
  String fname;
  String lname;
  String email;
  String username;
  String password;

  final category = ToMany<Category>();

  User(this.fname, this.lname, this.email, this.username, this.password,
      {this.userId = 0});
}
