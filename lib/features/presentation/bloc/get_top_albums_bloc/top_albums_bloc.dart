import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:last_fm/features/data/model/topalbums_model.dart';
import 'package:last_fm/features/domain/usecases/top_albums_usecase.dart';

part 'top_albums_event.dart';

part 'top_albums_state.dart';

class GetTopAlbumsBloc extends Bloc<TopAlbumsEvent, TopAlbumsState> {
  final TopAlbumsUseCase topAlbumsUseCase;

  GetTopAlbumsBloc({
    required this.topAlbumsUseCase,
  }) : super(GettingTopAlbumsInitialStatus()) {
    on<TopAlbumsEvent>((event, emit) async {
      if (event is GetTopAlbumsEvent) {
        emit(LoadingTopAlbumsStatus());
        final failureOrSuccessGettingTopAlbumsStatus = await topAlbumsUseCase(event.page);
        failureOrSuccessGettingTopAlbumsStatus.fold(
          (failure) => emit(ErrorGettingTopAlbumsStatus()),
          (topalbums) => emit(TopAlbumsRetrievedSuccessfullyStatus(topalbums)),
        );
      }
    });
  }
}
