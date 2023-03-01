import 'package:flutter_test/flutter_test.dart';
import 'package:my_second_app/app/constants.dart';
import 'package:my_second_app/data_source/remote_data_source/response/profile_response.dart';
import 'package:my_second_app/data_source/remote_data_source/response/user_response.dart';
import 'package:my_second_app/data_source/remote_data_source/user_data_source.dart';
import 'package:my_second_app/data_source/remote_data_source/visual_data_source.dart';
import 'package:my_second_app/model/user.dart';
import 'package:my_second_app/model/visual.dart';

void main() {
  test('User should be able to login', () async {
    bool expectedResult = true;
    String username = "samrai";
    String password = "samrai123";
    bool actualResult =
        await UserRemoteDataSource().loginUser(username, password);
    expect(actualResult, expectedResult);
  });
  test("user to get all visual", () async {
    Constant.token =
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhbXJhaUBnbWFpbC5jb20iLCJmbmFtZSI6IlNhbSIsImxuYW1lIjoiUmFpIiwiaW1hZ2UiOiIvaW1hZ2VzL3VzZXJfaW1hZ2UvSU1HLTE2NzU0MDcwMjcyNDIuanBlZyIsInVzZXJJZCI6IjYzZGNhZWIzZWZlY2IyNDRmMjQzM2EzNCIsImlhdCI6MTY3NzcwOTk1NiwiZXhwIjoxNjc3Nzk2MzU2fQ.jWFUeub-jxvPj2ypwyYRtuhzh2rfEETRcvKmBrm066c";
    List<Visual>? actualResult = await VisualRemoteDataSource().getAllVisual();
    expect(actualResult, isNotNull);
  });
  test("admin to get all user", () async {
    Constant.token =
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhbXJhaUBnbWFpbC5jb20iLCJmbmFtZSI6IlNhbSIsImxuYW1lIjoiUmFpIiwiaW1hZ2UiOiIvaW1hZ2VzL3VzZXJfaW1hZ2UvSU1HLTE2NzU0MDcwMjcyNDIuanBlZyIsInVzZXJJZCI6IjYzZGNhZWIzZWZlY2IyNDRmMjQzM2EzNCIsImlhdCI6MTY3NzcwOTk1NiwiZXhwIjoxNjc3Nzk2MzU2fQ.jWFUeub-jxvPj2ypwyYRtuhzh2rfEETRcvKmBrm066c";
    List<User>? actualResult = await UserRemoteDataSource().getAllUser();
    expect(actualResult, isNotNull);
  });
  test("admin to get all user", () async {
    Constant.token =
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhbXJhaUBnbWFpbC5jb20iLCJmbmFtZSI6IlNhbSIsImxuYW1lIjoiUmFpIiwiaW1hZ2UiOiIvaW1hZ2VzL3VzZXJfaW1hZ2UvSU1HLTE2NzU0MDcwMjcyNDIuanBlZyIsInVzZXJJZCI6IjYzZGNhZWIzZWZlY2IyNDRmMjQzM2EzNCIsImlhdCI6MTY3NzcwOTk1NiwiZXhwIjoxNjc3Nzk2MzU2fQ.jWFUeub-jxvPj2ypwyYRtuhzh2rfEETRcvKmBrm066c";
    ProfileResponse actualResult = await UserRemoteDataSource().userInfo();
    expect(actualResult, isNotNull);
  });

  test("user should be able to get visual by category", () async {
    String categoryId = "63da8cd7f06a417ca2bf1df8";
    Constant.token =
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhbXJhaUBnbWFpbC5jb20iLCJmbmFtZSI6IlNhbSIsImxuYW1lIjoiUmFpIiwiaW1hZ2UiOiIvaW1hZ2VzL3VzZXJfaW1hZ2UvSU1HLTE2NzU0MDcwMjcyNDIuanBlZyIsInVzZXJJZCI6IjYzZGNhZWIzZWZlY2IyNDRmMjQzM2EzNCIsImlhdCI6MTY3NzcwOTk1NiwiZXhwIjoxNjc3Nzk2MzU2fQ.jWFUeub-jxvPj2ypwyYRtuhzh2rfEETRcvKmBrm066c";
    List<Visual>? actualResult =
        await VisualRemoteDataSource().getVisualByCategory(categoryId);
    expect(actualResult, isNotNull);
  });
}
