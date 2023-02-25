import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mime/mime.dart';
import 'package:my_second_app/app/constants.dart';
import 'package:my_second_app/data_source/remote_data_source/response/visual_response.dart';
import 'package:my_second_app/helper/http_service.dart';
import 'package:http_parser/http_parser.dart';
import 'package:my_second_app/model/category.dart';
import 'package:my_second_app/model/visual.dart';

import '../../model/user.dart';

class VisualRemoteDataSource {
  final Dio _httpServices = HttpServices().getDioInstance();
  Future<int> addVisual(File? file, Visual visual) async {
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
        'description': visual.description,
        'title': visual.title,
        'category':
            visual.category.map((category) => category.categoryId).toList(),
        'image': image,
      });
      Response response = await _httpServices.post(Constant.VisualURL,
          data: formData,
          options: Options(headers: {
            "Authorization": Constant.token,
          }));
      if (response.statusCode == 201) {
        return 1;
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }

  Future<List<Visual>> getAllVisual() async {
    try {
      Response response = await _httpServices.get(Constant.VisualURL,
          options: Options(headers: {
            "Authorization": Constant.token,
          }));
      if (response.statusCode == 200) {
        VisualResponse visualResponse = VisualResponse.fromJson(response.data);
        return visualResponse.data!;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Failed to load Visual');
    }
  }

  Future<List<Visual>?> getVisualByCategory(String categoryId) async {
    try {
      Response response = await _httpServices.get(
        Constant.searchVisualByCategoryURL,
        queryParameters: {
          'categoryId': categoryId,
        },
        options: Options(
          headers: {
            "Authorization": Constant.token,
          },
        ),
      );
      List<Visual> lstVisuals = [];
      if (response.statusCode == 201) {
        VisualResponse vlResponse = VisualResponse.fromJson(response.data);
        lstVisuals = vlResponse.data!;
        return lstVisuals;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
