import 'package:ashesi_premier_league/helper/widgets/app_bar.dart';
import 'package:ashesi_premier_league/helper/widgets/future_builder.dart';
import 'package:ashesi_premier_league/helper/widgets/menu_widgets.dart';
import 'package:ashesi_premier_league/helper/widgets/text.dart';
import 'package:ashesi_premier_league/pages/pl/news.dart';
import 'package:ashesi_premier_league/pages/pl/results.dart';
import 'package:ashesi_premier_league/pages/pl/standings.dart';
import 'package:ashesi_premier_league/requests/news.dart';
import 'package:ashesi_premier_league/requests/season.dart';
import 'package:ashesi_premier_league/requests/standings.dart';
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
      appBar: const APLAppBar(),
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
                    SlidingNews(news: data),
                    const SizedBox(height: 5.0,),

                    const HomePageButton(
                      navigationPage: News(),
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
              builder: (data) {

                return Column(
                
                  children:[

                    const HomepageHeading(heading: "Latest Results"),
                  
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: (data.length > 3) ? 3 : data.length,
                      itemBuilder: (context, index) {
                        final result = data[index];
                        return HomePageResult(
                          result: result,
                          onTap: (){},
                        );
                      },
                    ),

                    const SizedBox(height: 5.0,),

                    const HomePageButton(
                      navigationPage: Results(),
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
              builder: (data) {
                return Column(
                  children: [

                    const HomepageHeading(heading: "Standings"),

                    const SizedBox(height: 5.0,),

                    if (data is Map)
                      HeaderText(
                        text: "${data['competition']['name']} (${data['competition']['gender']})",
                        fontWeight: FontWeight.w700,
                      ),

                    if (data is List)
                      HeaderText(
                        text: "${data[0]['competition']['name']} (${data[0]['competition']['gender']})",
                        fontWeight: FontWeight.w700,
                      ),


                    if (data is Map)
                      StandingsTable(standingsTeams: data['standings_teams']),

                    if (data is List)
                      for (Map<String,dynamic> table in data)
                        StandingsTable(standingsTeams: table['standings_teams']),


                    const SizedBox(height: 5.0,),

                    const HomePageButton(
                      navigationPage: StandingsEntry(),
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