import 'package:flutter/material.dart';
import 'package:mnews/models/news.dart';
import 'package:mnews/news_row.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'NEWS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<News> list = [];

  String newsUrl =
      'http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=fef95cba02dc4ca5b514813713664d93';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Container(
        child: list.length == 0
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: list.map((news) => NewsRow(news)).toList(),
              ),
      ),
    );
  }

  _fetchData() async {
    final response = await http.get(newsUrl);
    if (response.statusCode == 200) {
      list = ((json.decode(response.body)['articles']) as List)
          .map((data) => new News.fromJson(data))
          .toList();
      setState(() {});
    } else {
      print('Failed to load photos');
    }
  }
}
