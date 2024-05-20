// ignore_for_file: must_be_immutable
import 'package:ashesi_premier_league/util/date_time.dart';
import 'package:ashesi_premier_league/pages/pl/view_news.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class FeaturedNewsItem extends StatelessWidget{

  const FeaturedNewsItem(
    {
      super.key,
      required this.news,
      this.backgroundColor = Colors.white,
      this.titleColor = Colors.black,
      this.tagColor = const Color.fromARGB(255, 197, 50, 50),
    }
  );

  final Map<String,dynamic> news;
  final Color backgroundColor;
  final Color titleColor;
  final Color tagColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => ViewNews(news: news)
          )
        );
      },
      child: Container(
        height: 320,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: Column(
          children: [
            Image.network(
              news['featured_image'],
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return const Icon(Icons.error, color: Colors.white,);
              }
            ),

            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    news['title'],
                    style: GoogleFonts.poppins(
                      color: titleColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w700
                    ),
                  ),

                  const SizedBox(height: 10,),

                  Text(
                    news['tag']['name'],
                    style: GoogleFonts.poppins(
                      color: tagColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      )
      
    );
  }

}


class NewsItem extends StatelessWidget {

  const NewsItem(
    {
      super.key,
      required this.news
    }
  );

  final Map<String,dynamic> news;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.network(
          news['featured_image'],
          fit: BoxFit.cover,
          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
            return const Icon(Icons.error, color: Colors.white,);
          }
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            news['title'],
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "${news['tag']['name']} | ${formatDateIntoWords(news['pub_date'])}",
            style: GoogleFonts.poppins(
              fontSize: 12,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "By ${news['author']['first_name']} ${news['author']['last_name']}",
            style: GoogleFonts.poppins(
              fontSize: 12,
            ),
          ),
        ),



        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            news['text'],
            style: GoogleFonts.poppins(
              fontSize: 13,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

}



class NewsSlider extends StatefulWidget {

  const NewsSlider({
    super.key,
    required this.news,
  });

  final List<Map<String, dynamic>> news;

  @override
  SlidingNewsState createState() => SlidingNewsState();

}

class SlidingNewsState extends State<NewsSlider> {

  final PageController _pageController = PageController();
  double  currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 330, 
          child: PageView.builder(
            controller: _pageController,
            itemCount: (widget.news.length > 3) ? 3 : widget.news.length,
            itemBuilder: (context, index) {
              return FeaturedNewsItem(
                news: widget.news[index],
                backgroundColor: const Color.fromARGB(255, 197, 50, 50),
                titleColor: Colors.white,
                tagColor: Colors.white,
              );
            },
          ),
        ),
        DotsIndicator(
          dotsCount: (widget.news.length > 3) ? 3 : widget.news.length,
          position: int.parse(currentPage.toStringAsFixed(0)),
          decorator: const DotsDecorator(
            size: Size.square(5.0),
            activeSize: Size(12.0, 6.0),
            color: Colors.grey, // Inactive dot color
            activeColor: Colors.blue, // Active dot color
          ),
        ),
      ],
    );
  }
}
