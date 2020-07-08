import 'package:flutter/material.dart';
import 'package:mnews/models/news.dart';
import 'package:mnews/repositories/news_repository.dart';
import 'package:mnews/utilities/internetConnectivity.dart';
import 'package:provider/provider.dart';

 enum NewsState { Idle, Loading, Loaded, Error }

class NewsModel with ChangeNotifier {
  NewsRepository newsRepository = NewsRepository();

  List<News> news;

  NewsState get state => _state;
  NewsState _state = NewsState.Idle;
  String errorMessage;

  set newsList(List<News> news) {
    this.news = news;
  }

  void setState(NewsState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void getNews(category) async {
    // Check for Internet Connection
    setState(NewsState.Loading);
    bool isConnected =
        await isInternetConnected(); //TODO : Handle Internet Error With Listener

    if (isConnected) {
      news = await newsRepository.getNews(category: category);
      if (news != null) {
        newsList=news;
        setState(NewsState.Loaded);
      } else {
        errorMessage = " Error "; //TODO : Handle Error Message
        setState(NewsState.Error);

      }
    } else {
      errorMessage = " Interet Connection Error "; //TODO : Handle Error Message
      setState(NewsState.Error);

    }
  }
}
