import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mnews/models/news.dart';
import 'package:mnews/utilities/size_utility.dart';
import 'package:mnews/widgets/mText.dart';
import 'package:share/share.dart';

class NewsDetails extends StatefulWidget {
  NewsDetails();

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  News news;

  @override
  Widget build(BuildContext context) {
    news = ModalRoute.of(context).settings.arguments;
    return Scaffold(
//      appBar: AppBar(),
      body: Container(
        child: ListView(
          children: <Widget>[
            buildStack(context),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16.0, top: 32, bottom: 16),
              child: TitleText(
                news: news,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: SourceText(
                news: news,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              color: Colors.grey[400],
              width: MediaQuery.of(context).size.width,
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DescriptionText(
                news: news.getContent(),
                overflow: TextOverflow.visible,
              ),
            )
          ],
        ),
      ),
    );
  }

  Stack buildStack(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildBody(),
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(.2),
          ),
        ),
        SafeArea(
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () => Share.share(news.getTitle()),
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildBody() {
    return Hero(
        tag: "${news.getImage()}-${news.getTitle()}",
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/images/placeholder.jpg',
//            cacheManager: BaseCacheManager,
          image: news.getImage(),

          fadeInDuration: Duration(milliseconds: 50),

//            fit: BoxFit.cover,
//          errorWidget: (context, url, error) =>
//              Center(child: const Icon(Icons.error)),
          width: MediaQuery.of(context).size.width,
          height: UIUtills().getProportionalHeight(300),
          fit: BoxFit.cover,
        ));
    ;
  }
}
