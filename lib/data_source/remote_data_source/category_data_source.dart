import 'package:dio/dio.dart';

import 'package:my_second_app/app/constants.dart';
import 'package:my_second_app/data_source/remote_data_source/response/category_response.dart';
import 'package:my_second_app/helper/http_service.dart';
import 'package:my_second_app/model/category.dart';

class CategoryRemoteDataSource {
  final Dio _httpServices = HttpServices().getDioInstance();

  Future<List<Category>> getAllCategory() async {
    try {
      Response response = await _httpServices.get(
        Constant.categoryURL,
      );
      if (response.statusCode == 200) {
        CategoryResponse categoryResponse =
            CategoryResponse.fromJson(response.data);
        return categoryResponse.data!;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception('Failed to load course');
    }
  }
}
