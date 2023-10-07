part of 'top_albums_bloc.dart';

abstract class TopAlbumsState extends Equatable {
  const TopAlbumsState();

  @override
  List<Object> get props => [];
}

class GettingTopAlbumsInitialStatus extends TopAlbumsState {}

class LoadingTopAlbumsStatus extends TopAlbumsState {}

class ErrorGettingTopAlbumsStatus extends TopAlbumsState {}

class TopAlbumsRetrievedSuccessfullyStatus extends TopAlbumsState {
  final Topalbums topalbums;
  const TopAlbumsRetrievedSuccessfullyStatus(this.topalbums);
  @override
  List<Object> get props => [topalbums];

}
