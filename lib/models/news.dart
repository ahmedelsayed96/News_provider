




import 'package:json_annotation/json_annotation.dart';
import 'package:mnews/models/source.dart';

part 'news.g.dart';

@JsonSerializable()
class News {

  String title;
  String description;
  @JsonKey(name: 'urlToImage')
  String image;
  String publishedAt;
  Source source;
  String content;


  String getTitle() => this.title??'';
  String getDescription() => this.description??'';
  String getImage() => this.image??'';
  String getPublishedAt() => this.publishedAt??'';
  String getContent() => this.content??'';

  News(this.title, this.description, this.image,this.publishedAt,this.source,this.content);

  factory News.fromJson(Map<String, dynamic> json)=>_$NewsFromJson(json);


  Map<String,dynamic> toJson()=>_$NewsToJson(this);

}
