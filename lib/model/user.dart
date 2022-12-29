import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  @Id(assignable: true)
  int userId;
  String fname;
  String lname;
  String username;
  String password;

  User(this.fname, this.lname, this.username, this.password, {this.userId = 0});
}
