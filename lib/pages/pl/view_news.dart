import 'package:ashesi_premier_league/helper/widgets/app_bar.dart';
import 'package:ashesi_premier_league/helper/widgets/menu_widgets.dart';
import 'package:flutter/material.dart';

class ViewNews extends StatefulWidget {
  const ViewNews({
    super.key,
    required this.news,
  });

  final Map<String, dynamic> news;

  @override
  ViewNewsState createState() => ViewNewsState();
}

class ViewNewsState extends State<ViewNews> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: RegularAppBar(
        title: "News",
        prevContext: context
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            
          });
        },
        child: NewsItem(news: widget.news),
      ),
      backgroundColor: Colors.white),
    );
  }
}