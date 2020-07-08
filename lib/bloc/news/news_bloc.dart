import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnews/bloc/news/news_event.dart';
import 'package:mnews/bloc/news/news_state.dart';
import 'package:mnews/models/news.dart';
import 'package:mnews/repositories/news_repository.dart';
import 'package:mnews/utilities/internetConnectivity.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  String category;

  NewsBloc(this.category);
  List<News> news;
  NewsRepository newsRepository = NewsRepository();

  @override
  NewsState get initialState => NewsInitialized();

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is LoadNews) {
      yield* _getNews(category);
    }
  }

  // Get news from Api
  Stream<NewsState> _getNews(category) async* {
    yield NewsLoading();

    bool isConnected =
        await isInternetConnected(); //TODO : Handle Internet Error With Listener

    if (isConnected) {
      news = await newsRepository.getNews(category: category);
      if (news != null) {
        yield NewsLoaded(news: news);
      } else {
        yield NewsLoadedError(
            error: " Error "); //TODO : Handle Error Message

      }
    } else {
      yield NewsLoadedError(
          error: " Interet Connection Error "); //TODO : Handle Error Message

    }
  }
}
