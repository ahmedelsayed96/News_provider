import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mnews/bloc/news/news_bloc.dart';
import 'package:mnews/bloc/news/news_event.dart';
import 'package:mnews/bloc/news/news_state.dart';
import 'package:mnews/models/news.dart';
import 'package:mnews/style/my_colors.dart';
import '../news_row.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//ppzSDJhElUGw
class NewsList extends StatelessWidget  {
   String category;

   NewsList({@required this.category});

  @override
  Widget build(BuildContext context) {
    NewsBloc newsBloc=NewsBloc(category)..add(LoadNews());
    return BlocProvider(
      create: (context) => newsBloc,
      child: _buildList(newsBloc),
    );
  }

  _buildList(NewsBloc newsBloc) {
    print('build list');
    return BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
      if (state is NewsLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is NewsLoaded) {
        return Container(
          child: ListView.builder(
            itemCount: state.news.length,
             itemBuilder: (context,index){
              return NewsRow(state.news[index]);
             },
          ),
        );
      }else if (state is NewsLoadedError )
      {
        return  Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.error,color: Colors.grey,size: 50,),
              Text(state.error),
              InkWell(onTap:()=>newsBloc.add(LoadNews()) ,child: Text('Retry',style: TextStyle(color: accentColor,fontWeight: FontWeight.bold))),
            ],
          ),
        );
      }
      return Container();
    });
  }


}

