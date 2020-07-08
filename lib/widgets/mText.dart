import 'package:flutter/material.dart';
import 'package:mnews/models/news.dart';
import 'package:mnews/utilities/size_utility.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    @required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    return Text(
        news.getTitle(),
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: UIUtills().getProportionalWidth(17)),
        maxLines: 2,
      );
  }
}

class DescriptionText extends StatelessWidget {
  TextOverflow overflow;

  DescriptionText({@required this.news, this.overflow = TextOverflow.ellipsis});

  final String  news;

  @override
  Widget build(BuildContext context) {
    return Text(
      news,

      overflow: overflow,
//                maxLines: 3,
      style: TextStyle(fontSize: UIUtills().getProportionalWidth(14)),
    );
  }
}
class SourceText extends StatelessWidget {
  const SourceText({
    @required this.news,
  }) ;

  final News news;

  @override
  Widget build(BuildContext context) {
    return Text(
      news.source.name,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: UIUtills().getProportionalWidth(14)),
      maxLines: 2,
    );
  }
}




