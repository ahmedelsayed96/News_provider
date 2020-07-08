import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mnews/localization/app_localizations.dart';
import 'package:mnews/models/news.dart';
import 'package:mnews/pages/drawer.dart';
import 'package:mnews/pages/news_list.dart';
import 'package:mnews/providers/news_provider.dart';
import 'package:mnews/style/my_colors.dart';
import 'package:provider/provider.dart';

const List categories = [
  'Business',
  'Entertainment',
  'General',
  'Health',
  'Science',
  'Sports',
  'Technology'
];

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> tabs = categories
      .map((category) =>
      Tab(
        text: category,
      ))
      .toList();

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        drawer: CategoriesDrawer(controller: _tabController),

        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  iconTheme: new IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  title: new Text(
                    AppLocalizations.of(context).translate('title'),
                    style: TextStyle(color: Colors.black),
                  ),
                  pinned: true,
                  floating: true,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.black45,
                    labelColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: new BubbleTabIndicator(
                      indicatorHeight: 30.0,
                      indicatorColor: accentColor,
                      tabBarIndicatorSize: TabBarIndicatorSize.tab,
                    ),
                    tabs: tabs,
                    controller: _tabController,
                  )),
            ];
          },
          body: TabBarView(
              dragStartBehavior: DragStartBehavior.start,
              controller: _tabController,
              children: categories
                  .map((c) =>
                  ChangeNotifierProvider<NewsModel>(
                    create: (context) =>
                    NewsModel()..getNews(c),
                    child: NewsList(
                    category: c,
                  ),
              ))
              .toList(),
        )),);
  }
}
