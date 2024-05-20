import 'package:ashesi_premier_league/controller/news.dart';
import 'package:ashesi_premier_league/widgets/app_bar.dart';
import 'package:ashesi_premier_league/widgets/future_builder.dart';
import 'package:ashesi_premier_league/widgets/list_tile.dart';
import 'package:ashesi_premier_league/widgets/news_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class News extends StatefulWidget {

  const News ({
    super.key,
  });

  @override
  NewsState createState() => NewsState();
}

class NewsState extends State<News> {

  Future<List<Map<String, dynamic>>> _getNewsButFirst() async {
    // returns a list of news items except the first one
    List<Map<String, dynamic>> news = await getNewsItems();
    news.removeAt(0);
    return news;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarWithPrevButton(
          title: 'News',
          prevContext: context,
        ),

        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              getNewsItems();
            });
          },

          child: Column(
            children: [
              AppFutureBuilder(
                future: getNewsItems(), 
                builder: (newsItems) {
                  return FeaturedNewsItem(
                    news: newsItems[0],
                  );
                }, 
                reloadPageFunction: () {
                  setState(() {
                    getNewsItems();
                  });
                }, 
                errorText: "news item",
                errorTextColor: Colors.white,
              ),

              const SizedBox(height: 20),
              
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "More News",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                    ),
                  ) 
                ),
              ),

              const SizedBox(height: 10),
            
              Expanded(
                child: AppFutureBuilder(
                  future: _getNewsButFirst(), 
                  builder: (newsItems) {
                    return ListView.separated(
                      itemCount: newsItems.length,
                      separatorBuilder: (context, index) => const SizedBox(),
                      itemBuilder: (context, index) {
                        final news = newsItems[index];

                        return NewsListTile (
                          news: news,
                        );
                      },
                    );
                  }, 
                  reloadPageFunction: () {
                    setState(() {
                      _getNewsButFirst();
                    });
                  }, 
                  errorText: "more news items",
                  errorTextColor: Colors.white,
                ),
              ),
            ]
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 197, 50, 50),
      )
    );
  }
}