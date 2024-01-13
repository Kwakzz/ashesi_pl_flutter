import 'package:ashesi_premier_league/helper/widgets/menu_widgets.dart';
import 'package:ashesi_premier_league/pages/pl/coaches.dart';
import 'package:ashesi_premier_league/pages/pl/fixtures.dart';
import 'package:ashesi_premier_league/pages/pl/news.dart';
import 'package:ashesi_premier_league/pages/pl/players.dart';
import 'package:ashesi_premier_league/pages/pl/results.dart';
import 'package:ashesi_premier_league/pages/pl/standings.dart';
import 'package:ashesi_premier_league/pages/pl/teams.dart';
import 'package:flutter/material.dart';


class Pl extends StatefulWidget {
  const Pl(
    {
      super.key
    }
  );

  @override
  MoreState createState() => MoreState();
}

class MoreState extends State<Pl> {

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

        // NextFixture(
        //   onTap: (){}, 
        //   team1LogoLink: "https://res.cloudinary.com/dvghxq3ba/image/upload/v1703097680/Team%20Logos/elite_logo_pmbtg5.png",
        //   team2LogoLink: "https://res.cloudinary.com/dvghxq3ba/image/upload/v1703097681/Team%20Logos/lu_logo_oailhh.png",
        // ),

        const SizedBox(height: 20),

        MenuListTile(
          title: "Fixtures", 
          iconData: Icons.sports_soccer,
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const Fixtures()
              )
            );
          }
        ),

        MenuListTile(
          title: "Results", 
          iconData: Icons.insert_chart,
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const Results()
              )
            );
          }
        ),

        MenuListTile(
          title: "Standings", 
          iconData: Icons.table_chart,
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const StandingsEntry()
              )
            );
          }
        ),

        const SizedBox(height: 10),

        MenuListTile(
          title: "Players", 
          iconData: Icons.run_circle,
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const Players()
              )
            );
          }
        ),

        MenuListTile(
          title: "Teams", 
          iconData: Icons.group,
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const Teams()
              )
            );
          }
        ),

        MenuListTile(
          title: "Coaches", 
          iconData: Icons.person,
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const Coaches()
              )
            );
          }
        ),

        const SizedBox(height: 10,),

        MenuListTile(
          title: "News", 
          iconData: Icons.newspaper,
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const News()
              )
            );
          }
        ),

        // MenuListTile(
        //   title: "Videos", 
        //   iconData: Icons.movie,
        //   onTap: () {}
        // ),
      ]
    );
  }
}