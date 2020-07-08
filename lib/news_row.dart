import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mnews/models/news.dart';
import 'package:mnews/navigator.dart';
import 'package:mnews/pages/news_details.dart';
import 'package:mnews/routes.dart';
import 'package:mnews/style/my_colors.dart';
import 'package:mnews/utilities/size_utility.dart';
import 'package:mnews/widgets/mText.dart';

class NewsRow extends StatelessWidget {
  double height;
  double width;

  News news;

  NewsRow(this.news);

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    UIUtills().updateScreenDimesion(width: width, height: height);
    print('reloading : ${news.getTitle()}');
    return Container(
      padding: EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () {
          pushNameWithArguments(context,NewsDetailsRoute,news);
        },
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            _buildCard(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: new BoxDecoration(
//                color: Colors.grey[400],
                border: Border.all(width: 2, color: headerColor),
                borderRadius: new BorderRadius.all(Radius.circular(8.0)),
                shape: BoxShape.rectangle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Hero(
                  tag: "${news.getImage()}-${news.getTitle()}",
//                    child: FadeInImage.assetNetwork(
//                      placeholder: "assets/images/placeholder.jpg",
//                      image:news.getImage(),
//                      fit: BoxFit.cover,
//                      fadeInDuration: Duration(milliseconds: 50),
//                    ),

                  child: FadeInImage.assetNetwork(
                    image:  news.getImage(),
//                    imageUrl:,
                    fit: BoxFit.cover,
                    placeholder: 'assets/images/placeholder.jpg',
                      fadeInDuration: Duration(milliseconds: 50),
//                    errorWidget: (context, url, error) =>
//                        Center(child: const Icon(Icons.error)),
                    width: UIUtills().getProportionalWidth(120),
                    height: UIUtills().getProportionalHeight(160),
//
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCard() {
    return Card(
      elevation: 8,
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(left: UIUtills().getProportionalWidth(140)),
        height: UIUtills().getProportionalHeight(140),
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
              child: Text(
                news.publishedAt?.substring(0, 10) ?? '',
                textAlign: TextAlign.end,
//              overflow: TextOverflow.ellipsis,
//                maxLines: 3,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: UIUtills().getProportionalWidth(12)),
              ),
            ),
            TitleText(news: news),
            Padding(
              padding: EdgeInsets.all(8),
              child: DescriptionText(news: news.getDescription()),
            ),
            SourceText(news: news),
          ],
        ),
      ),
    );
  }
}


