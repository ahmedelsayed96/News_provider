// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(
    json['title'] as String,
    json['description'] as String,
    json['urlToImage'] as String,
    json['publishedAt'] as String,
    json['source'] == null
        ? null
        : Source.fromJson(json['source'] as Map<String, dynamic>),
    json['content'] as String,
  );
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'urlToImage': instance.image,
      'publishedAt': instance.publishedAt,
      'source': instance.source,
      'content': instance.content,
    };
