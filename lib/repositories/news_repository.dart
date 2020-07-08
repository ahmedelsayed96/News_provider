import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mnews/models/news.dart';

class NewsRepository {
 //Get news From Appi
  Future<List<News>> getNews({@required String category}) async {
    String newsUrl =
        'http://newsapi.org/v2/top-headlines?country=us&category=${category.toLowerCase()}&apiKey=fef95cba02dc4ca5b514813713664d93';

     var  response = await http.get(newsUrl);
    if (response.statusCode == 200) {
      return ((json.decode(response.body)['articles']) as List)
          .map((data) => new News.fromJson(data))
          .toList();
    } else {
      return null;
    }
  }
}
