import 'dart:io';

import 'package:my_second_app/app/network_connectivity.dart';
import 'package:my_second_app/data_source/remote_data_source/visual_data_source.dart';
import 'package:my_second_app/model/visual.dart';

abstract class VisualRepository {
  Future<int> addAllVisual(File? file, Visual visual);
  Future<List<Visual>> getVisual();
  Future<List<Visual>?> getVisualByCategory(String categoryId);
}

class VisualRepsitoryImpl extends VisualRepository {
  @override
  Future<int> addAllVisual(File? file, Visual visual) {
    return VisualRemoteDataSource().addVisual(file, visual);
  }

  @override
  Future<List<Visual>> getVisual() async {
    bool status = await NetworkConnectivity.isOnline();
    if (status) {
      return VisualRemoteDataSource().getAllVisual();
    } else {
      return [];
    }
  }

  @override
  Future<List<Visual>?> getVisualByCategory(String categoryId) async {
    bool status = await NetworkConnectivity.isOnline();
    if (status) {
      return VisualRemoteDataSource().getVisualByCategory(categoryId);
    } else {
      return [];
    }
  }
}
