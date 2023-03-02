import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_second_app/app/constants.dart';
import 'package:my_second_app/data_source/remote_data_source/category_data_source.dart';
import 'package:my_second_app/data_source/remote_data_source/response/profile_response.dart';
import 'package:my_second_app/data_source/remote_data_source/response/user_response.dart';
import 'package:my_second_app/data_source/remote_data_source/user_data_source.dart';
import 'package:my_second_app/data_source/remote_data_source/visual_data_source.dart';
import 'package:my_second_app/model/category.dart';
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
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhbXJhaUBnbWFpbC5jb20iLCJmbmFtZSI6IlNhbSIsImxuYW1lIjoiUmFpIiwiaW1hZ2UiOiIvaW1hZ2VzL3VzZXJfaW1hZ2UvSU1HLTE2Nzc3MTgxNzQyMDYuanBlZyIsInVzZXJJZCI6IjYzZmZmMjllMjZjODI1MWFmMmE0ZjY4YyIsImlhdCI6MTY3NzcyNjY4OSwiZXhwIjoxNjc3ODEzMDg5fQ._M2akCrOK829xvmIbdijBZGPi5SD1J__ulP_MkLi61Q";
    List<Visual>? actualResult = await VisualRemoteDataSource().getAllVisual();
    expect(actualResult, isNotNull);
  });
  test("admin to get all user", () async {
    Constant.token =
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhbXJhaUBnbWFpbC5jb20iLCJmbmFtZSI6IlNhbSIsImxuYW1lIjoiUmFpIiwiaW1hZ2UiOiIvaW1hZ2VzL3VzZXJfaW1hZ2UvSU1HLTE2Nzc3MTgxNzQyMDYuanBlZyIsInVzZXJJZCI6IjYzZmZmMjllMjZjODI1MWFmMmE0ZjY4YyIsImlhdCI6MTY3NzcyNjY4OSwiZXhwIjoxNjc3ODEzMDg5fQ._M2akCrOK829xvmIbdijBZGPi5SD1J__ulP_MkLi61Q";
    List<User>? actualResult = await UserRemoteDataSource().getAllUser();
    expect(actualResult, isNotNull);
  });
  test("Get Logged In User Information ", () async {
    Constant.token =
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhbXJhaUBnbWFpbC5jb20iLCJmbmFtZSI6IlNhbSIsImxuYW1lIjoiUmFpIiwiaW1hZ2UiOiIvaW1hZ2VzL3VzZXJfaW1hZ2UvSU1HLTE2Nzc3MTgxNzQyMDYuanBlZyIsInVzZXJJZCI6IjYzZmZmMjllMjZjODI1MWFmMmE0ZjY4YyIsImlhdCI6MTY3NzcyNjY4OSwiZXhwIjoxNjc3ODEzMDg5fQ._M2akCrOK829xvmIbdijBZGPi5SD1J__ulP_MkLi61Q";
    ProfileResponse actualResult = await UserRemoteDataSource().userInfo();
    expect(actualResult, isNotNull);
  });

  test("user should be able to get visual by category", () async {
    String categoryId = "63fff42726c8251af2a4f69c";
    Constant.token =
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhbXJhaUBnbWFpbC5jb20iLCJmbmFtZSI6IlNhbSIsImxuYW1lIjoiUmFpIiwiaW1hZ2UiOiIvaW1hZ2VzL3VzZXJfaW1hZ2UvSU1HLTE2Nzc3MTgxNzQyMDYuanBlZyIsInVzZXJJZCI6IjYzZmZmMjllMjZjODI1MWFmMmE0ZjY4YyIsImlhdCI6MTY3NzcyNjY4OSwiZXhwIjoxNjc3ODEzMDg5fQ._M2akCrOK829xvmIbdijBZGPi5SD1J__ulP_MkLi61Q";
    List<Visual>? actualResult =
        await VisualRemoteDataSource().getVisualByCategory(categoryId);
    expect(actualResult, isNotNull);
  });

  test("getting all category", () async {
    var actualResult = await CategoryRemoteDataSource().getAllCategory();
    expect(actualResult, isNotNull);
  });
}
