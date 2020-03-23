import 'package:flutter/material.dart';
import 'package:mnews/models/news.dart';

class NewsRow extends StatelessWidget {
  double height;
  double width;
  News news;
  NewsRow(this.news);

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(16),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          _buildCard(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                news.image,
                width: 120,
                fit: BoxFit.cover,
                height: 160,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCard() {
    return Card(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(left: 120 + 20.0),
        height: 140,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              news.title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
              maxLines: 2,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                news.description,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
