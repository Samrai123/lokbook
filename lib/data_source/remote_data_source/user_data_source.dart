import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:my_second_app/app/constants.dart';
import 'package:my_second_app/data_source/local_data_source/user_data_source.dart';
import 'package:my_second_app/data_source/remote_data_source/response/login_response.dart';
import 'package:my_second_app/data_source/remote_data_source/response/profile_response.dart';
import 'package:my_second_app/data_source/remote_data_source/response/user_response.dart';
import 'package:my_second_app/helper/http_service.dart';
import 'package:my_second_app/model/user.dart';
import 'package:http_parser/http_parser.dart';

class UserRemoteDataSource {
  final Dio _httpServices = HttpServices().getDioInstance();

  Future<int> addUser(File? file, User user) async {
    try {
      MultipartFile? image;
      if (file != null) {
        var mimeType = lookupMimeType(file.path);
        image = await MultipartFile.fromFile(
          file.path,
          filename: file.path.split("/").last,
          contentType: MediaType("image", mimeType!.split("/")[1]),
        );
      }

      FormData formData = FormData.fromMap({
        'fname': user.fname,
        'lname': user.lname,
        'email': user.email,
        'username': user.username,
        'password': user.password,
        'category':
            user.category.map((category) => category.categoryId).toList(),
        'image': image,
      });
      Response response = await _httpServices.post(
        Constant.UserURL,
        data: formData,
      );
      if (response.statusCode == 201) {
        return 1;
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }

  Future<bool> loginUser(String username, String password) async {
    try {
      Response response = await _httpServices.post(
        Constant.UserLoginURL,
        data: {
          'username': username,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        Constant.token = "Bearer ${loginResponse.token!}";
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<List<User>> getAllUser() async {
    try {
      Response response = await _httpServices.get(Constant.UserURL,
          options: Options(headers: {
            "Authorization": Constant.token,
          }));
      if (response.statusCode == 200) {
        UserResponse userResponse = UserResponse.fromJson(response.data);
        return userResponse.data!;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Failed to load User');
    }
  }

  Future<ProfileResponse> userInfo() async {
    ProfileResponse? profileResponse;
    final url = Constant.baseURL + Constant.ProfileURL;
    try {
      var dio = HttpServices().getDioInstance();
      Response response = await dio.get(url,
          options: Options(headers: {
            "Authorization": Constant.token,
          }));
      if (response.statusCode == 200) {
        profileResponse = ProfileResponse.fromJson(response.data);
      } else {
        profileResponse = null;
      }
    } catch (e) {
      throw Exception(e);
    }
    return profileResponse!;
  }
}
