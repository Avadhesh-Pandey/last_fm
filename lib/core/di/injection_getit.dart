import 'package:get_it/get_it.dart';
import 'package:last_fm/features/data/datasource/remote/top_albums_remote_data_source.dart';
import 'package:last_fm/features/data/datasource/remote/network/api_services.dart';
import 'package:last_fm/features/data/repositories/top_albums_repository_impl.dart';
import 'package:last_fm/features/domain/repositories/top_albums_repository.dart';
import 'package:last_fm/features/domain/usecases/top_albums_usecase.dart';
import 'package:last_fm/features/presentation/bloc/get_top_albums_bloc/top_albums_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerLazySingleton(() => ApiServices());

  //bloc
  sl.registerFactory(
    () => GetTopAlbumsBloc(topAlbumsUseCase: sl(),
    ),
  );

  //use cases
  sl.registerLazySingleton(() => TopAlbumsUseCase(sl()));

  //data sources
  sl.registerLazySingleton<TopAlbumsDataSource>(
        () => TopAlbumsRemoteDataSourceImpl(apiServices: sl()),
  );

  //repos
  sl.registerLazySingleton<TopAlbumsRepository>(
    () => TopAlbumRepositoryImpl(remoteDataSource: sl()),
  );
}
