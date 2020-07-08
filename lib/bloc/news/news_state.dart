import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:mnews/models/news.dart';

abstract class NewsState extends Equatable {
  @override
  List<Object> get props => [];
}

class NewsInitialized extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  List<News> news;

  NewsLoaded({@required this.news});

  @override
  List<Object> get props => [this.news];
}

class NewsLoadedError extends NewsState {
  String  error;

  NewsLoadedError({@required this.error});

  @override
  List<Object> get props => [this.error];
}

