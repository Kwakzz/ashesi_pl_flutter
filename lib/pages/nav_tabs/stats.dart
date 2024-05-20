import 'package:ashesi_premier_league/pages/stats/clean_sheet_rankings.dart';
import 'package:ashesi_premier_league/pages/stats/red_card_rankings.dart';
import 'package:ashesi_premier_league/pages/stats/top_assisters.dart';
import 'package:ashesi_premier_league/pages/stats/top_scorers.dart';
import 'package:ashesi_premier_league/pages/stats/yellow_card_rankings.dart';
import 'package:ashesi_premier_league/widgets/card.dart';
import 'package:flutter/material.dart';


class Stats extends StatefulWidget {
  const Stats(
    {
      super.key
    }
  );

  @override
  StatsState createState() => StatsState();
}

class StatsState extends State<Stats> {

  // @override
  // void initState() {
  //   super.initState();
  //   initializeWidgetOptions();
  // }

  /// Checks if the user is logged in
  // Future<void> initializeWidgetOptions() async {

  //   SharedPreferences prefs = await SharedPreferences.getInstance();

    
  // }

  @override
  Widget build(BuildContext context) {
    
    return ListView(
      children: [

        const SizedBox(height: 20),

        StatsTabCard(
          playerImageLink: "https://www.footyrenders.com/render/cristiano-ronaldo-9.png",
          title: "GOALS",
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const TopScorersEntry()
              )
            );
          }
        ),

        StatsTabCard(
          playerImageLink: "https://www.footyrenders.com/render/jude-bellingham-1.png",
          title: "ASSISTS",
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const TopAssistersEntry()
              )
            );
          }
        ),

        StatsTabCard(
          playerImageLink: "https://www.footyrenders.com/render/emiliano-martinez-7.png",
          title: "CLEAN SHEETS",
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const CleanSheetRankingEntry()
              )
            );
          }
        ),

        StatsTabCard(
          playerImageLink: "https://www.footyrenders.com/render/cole-palmer-4.png",
          title: "YELLOW CARDS",
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const YellowCardRankingEntry()
              )
            );
          }
        ),

        StatsTabCard(
          playerImageLink: "https://www.footyrenders.com/render/nicolas-jackson-3.png",
          title: "RED CARDS",
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const RedCardRankingEntry()
              )
            );
          }
        ),

      ]
    
    );
  }
}