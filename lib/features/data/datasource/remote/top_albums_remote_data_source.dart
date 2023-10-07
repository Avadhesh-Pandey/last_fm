import 'dart:async';

import 'package:last_fm/core/error/failure.dart';
import 'package:last_fm/features/data/datasource/remote/network/api_services.dart';
import 'package:last_fm/features/data/model/topalbums_model.dart';

abstract class TopAlbumsDataSource {
  Future<Topalbums> getTopAlbums(int page);
}

class TopAlbumsRemoteDataSourceImpl implements TopAlbumsDataSource {
  final ApiServices apiServices;

  TopAlbumsRemoteDataSourceImpl({
    required this.apiServices,
  });

  @override
  Future<Topalbums> getTopAlbums(int page) async {
    try {
      var response = await apiServices.getTopAlbums(page);
      return TopalbumsModel.fromJson(response.data).topalbums!;
    } catch (e) {
      throw APIFailure("API failure");
    }
  }
}
