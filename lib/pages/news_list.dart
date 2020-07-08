
import 'package:flutter/material.dart';
import 'package:mnews/models/news.dart';
import 'package:mnews/providers/news_provider.dart';
import 'package:mnews/style/my_colors.dart';
import 'package:provider/provider.dart';
import '../news_row.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//ppzSDJhElUGw
class NewsList extends StatelessWidget {
  String category;

  NewsList({@required this.category});

  @override
  Widget build(BuildContext context) {
    return  _buildList(context);

  }

  _buildList(BuildContext context) {
    NewsModel newsModel = context.watch<NewsModel>();
    if (newsModel.state == NewsState.Loading) {
      return Center(child: CircularProgressIndicator());
    } else if (newsModel.state == NewsState.Loaded) {
      // display loaded news
      return Container(
        child: ListView.builder(
          itemCount: newsModel.news.length,
          itemBuilder: (context, index) {
            return NewsRow(newsModel.news[index]);
          },
        ),
      );
    } else if (newsModel.state == NewsState.Error) {
      // in Case of Error Display Error Icon and message
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.error,
              color: Colors.grey,
              size: 50,
            ),
            Text(newsModel.errorMessage),
            InkWell(
                onTap: () => newsModel.getNews(category),
                child: Text('Retry',
                    style: TextStyle(
                        color: accentColor, fontWeight: FontWeight.bold))),
          ],
        ),
      );
    }
    return Container();
  }
}
