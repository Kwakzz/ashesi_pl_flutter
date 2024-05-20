import 'package:ashesi_premier_league/pages/pl/news.dart';
import 'package:ashesi_premier_league/pages/pl/results.dart';
import 'package:ashesi_premier_league/pages/pl/standings.dart';
import 'package:ashesi_premier_league/controller/news.dart';
import 'package:ashesi_premier_league/controller/season.dart';
import 'package:ashesi_premier_league/controller/standings.dart';
import 'package:ashesi_premier_league/widgets/app_bar.dart';
import 'package:ashesi_premier_league/widgets/button.dart';
import 'package:ashesi_premier_league/widgets/card.dart';
import 'package:ashesi_premier_league/widgets/future_builder.dart';
import 'package:ashesi_premier_league/widgets/news_item.dart';
import 'package:ashesi_premier_league/widgets/rankings.dart';
import 'package:ashesi_premier_league/widgets/text.dart';
import 'package:flutter/material.dart';


class Latest extends StatefulWidget {
  const Latest(
    {
      super.key
    }
  );

  @override
  LatestState createState() => LatestState();
}

class LatestState extends State<Latest> {



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: const AppBarWithAPLLogo(),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            getNewsItems();
            getLatestResults(); 
            getMensLatestStandings();

          });
        },
        child: ListView(
          children: [
            AppFutureBuilder(
              future: getNewsItems(), 
              builder: (data) {
                return Column(
                  children: [

                    NewsSlider(news: data),
                    const SizedBox(height: 5.0,),

                    const HomePageButton(
                      nextPage: News(),
                      text: "View All News",
                    )
                  ],
                );
              }, 
              reloadPageFunction: () {
                setState(() {
                  getNewsItems();
                });
              },
              errorText: "news",
            ),

            const SizedBox(height: 20.0,),

            AppFutureBuilder(
              future: getLatestResults(), 
              builder: (results) {

                return Column(
                
                  children:[

                    const HomepageHeading(heading: "Latest Results"),
                  
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: (results.length > 3) ? 3 : results.length,
                      itemBuilder: (context, index) {
                        final result = results[index];
                        return MatchResultCardForHomePage(
                          result: result,
                        );
                      },
                    ),

                    const SizedBox(height: 5.0,),

                    const HomePageButton(
                      nextPage: Results(),
                      text: "View All Results",
                    )
                  ]
                );
              },
              reloadPageFunction: () {
                setState(() {
                  getLatestResults();
                });
              },
              errorText: "results",
            ),

            const SizedBox(height: 20.0,),

            AppFutureBuilder(
              future: getMensLatestStandings(),
              builder: (standings) {
                return Column(
                  children: [

                    const HomepageHeading(heading: "Standings"),

                    const SizedBox(height: 7.5,),

                    if (standings is Map)
                      HeaderText(
                        text: "${standings['competition']['name']} (${standings['competition']['gender']})",
                        fontWeight: FontWeight.w700,
                      ),

                    if (standings is List)
                      HeaderText(
                        text: "${standings[0]['competition']['name']} (${standings[0]['competition']['gender']})",
                        fontWeight: FontWeight.w700,
                      ),


                    if (standings is Map)
                      StandingsTable(standingsTeams: standings['standings_teams']),

                    if (standings is List)
                      for (Map<String,dynamic> table in standings)
                        StandingsTable(standingsTeams: table['standings_teams']),


                    const SizedBox(height: 5.0,),

                    const HomePageButton(
                      nextPage: StandingsEntry(),
                      text: "View Full Standings",
                    )
                  ],
                );
              },
              reloadPageFunction: () {
                setState(() {
                  getMensLatestStandings();
                });
              },
              errorText: "standings",
            ),

            const SizedBox(height: 20.0,),



          ],
        )
      ),
      backgroundColor: Colors.white
    );
  }
}