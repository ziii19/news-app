part of 'news_bloc.dart';

class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class GetContent extends NewsEvent {}

class LikeContent extends NewsEvent {
  final int id;

  const LikeContent({required this.id});
  @override
  List<Object> get props => [id];
}

class UnlikeContent extends NewsEvent {
  final int id;

  const UnlikeContent({required this.id});

  @override
  List<Object> get props => [id];
}
