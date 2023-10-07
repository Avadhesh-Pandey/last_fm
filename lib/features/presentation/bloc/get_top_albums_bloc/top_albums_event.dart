part of 'top_albums_bloc.dart';

abstract class TopAlbumsEvent extends Equatable {
  const TopAlbumsEvent();

  @override
  List<Object> get props => [];
}

class GetTopAlbumsEvent extends TopAlbumsEvent {
  final int page;
  const GetTopAlbumsEvent({this.page=0});
  @override
  List<Object> get props => [page];

}
