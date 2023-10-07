import 'package:dartz/dartz.dart';
import 'package:last_fm/core/error/failure.dart';
import 'package:last_fm/core/usecases/usecase.dart';
import 'package:last_fm/features/data/model/topalbums_model.dart';
import 'package:last_fm/features/domain/repositories/top_albums_repository.dart';

class TopAlbumsUseCase implements UseCase<Topalbums, int> {
  final TopAlbumsRepository jokesRepository;

  TopAlbumsUseCase(this.jokesRepository);

  @override
  Future<Either<Failure, Topalbums>> call(int page) async {
    return jokesRepository.getTopAlbums(page);
  }
}
