part of 'news_bloc.dart';

class NewsState extends Equatable {
  const NewsState(
      {this.news = const [], this.error, this.status = Status.initial});

  final List<PostModel> news;
  final String? error;
  final Status status;

  factory NewsState.initial() {
    return const NewsState();
  }

  NewsState copywith({
    List<PostModel>? news,
    String? error,
    Status? status,
  }) {
    return NewsState(
      news: news ?? this.news,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [news, error, status];
}
