import 'package:dartz/dartz.dart';
import 'package:last_fm/core/error/failure.dart';
import '../../data/model/topalbums_model.dart';

abstract class TopAlbumsRepository {
  Future<Either<Failure, Topalbums>> getTopAlbums(int page);
}
