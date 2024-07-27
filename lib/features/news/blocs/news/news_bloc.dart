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
  }
}
