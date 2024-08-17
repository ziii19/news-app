part of 'news_bloc.dart';

class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class GetContent extends NewsEvent {}

class ShowContent extends NewsEvent {
  final int id;

  const ShowContent({required this.id});
  @override
  List<Object> get props => [id];
}

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

class AddContent extends NewsEvent {
  final String title;
  final String newsContent;
  final File image;

  const AddContent(
      {required this.title, required this.newsContent, required this.image});

  @override
  List<Object> get props => [title, newsContent, image];
}
