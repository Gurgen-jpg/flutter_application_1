import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/models/news.dart';
import 'package:flutter_application_1/models/news_response.dart';
import 'package:flutter_application_1/services/news_service.dart';
import 'package:meta/meta.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc(this.newsService) : super(NewsInitial()) {
    on<LoadNews>(_onLoadNEws);
  }

  final NewsService newsService;

  Future<void> _onLoadNEws(NewsEvent event, Emitter<NewsState> emit) async {
    emit(NewsLoading());

    await Future.delayed(Duration(seconds: 3));

    try {
      final pagination = await newsService.getNews();

      final news =
          pagination.results?.map(connvertResponseToNewsModel).toList();

      if (news != null) {
        emit(NewsSuccess(news: news));
      }
    } catch (e) {
      emit(NewsFailure());
    }
  }
}
