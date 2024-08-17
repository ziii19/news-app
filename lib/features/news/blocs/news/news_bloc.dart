import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/core.dart';

import '../../news.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsState.initial()) {
    on<GetContent>((event, emit) async {
      try {
        emit(state.copywith(status: Status.loading));

        final data = await Database().getNewsContent();

        emit(state.copywith(status: Status.success, news: data));
      } catch (e) {
        emit(state.copywith(status: Status.failure, error: e.toString()));
      }
    });

    on<ShowContent>((event, emit) async {
      await Database().showContentDetail(id: event.id);

      final data = await Database().getNewsContent();

      emit(state.copywith(news: data));
    });

    on<LikeContent>((event, emit) async {
      await Database().unlike(id: event.id);

      final data = await Database().getNewsContent();

      emit(state.copywith(news: data));
    });

    on<UnlikeContent>((event, emit) async {
      await Database().like(id: event.id);
      final data = await Database().getNewsContent();

      emit(state.copywith(news: data));
    });

    on<AddContent>((event, emit) async {
      emit(state.copywith(status: Status.loading));
      try {
        await Database().createPost(
            title: event.title,
            newsContent: event.newsContent,
            image: event.image);

        final data = await Database().getNewsContent();

        emit(state.copywith(status: Status.success, news: data));
      } catch (e) {
        emit(state.copywith(status: Status.failure, error: e.toString()));
      }
    });
  }
}
