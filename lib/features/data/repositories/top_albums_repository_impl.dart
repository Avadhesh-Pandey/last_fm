import 'package:dartz/dartz.dart';
import 'package:last_fm/core/error/failure.dart';
import 'package:last_fm/features/data/datasource/remote/top_albums_remote_data_source.dart';
import 'package:last_fm/features/data/model/topalbums_model.dart';
import 'package:last_fm/features/domain/repositories/top_albums_repository.dart';

class TopAlbumRepositoryImpl implements TopAlbumsRepository {
  final TopAlbumsDataSource remoteDataSource;

  TopAlbumRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Topalbums>> getTopAlbums(int page) async {
    try {
      var response = await remoteDataSource.getTopAlbums(page);
      return right(response);
    } catch (e) {
      throw APIFailure("API failure");
    }
  }
}
