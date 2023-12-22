import 'package:ashesi_premier_league/helper/widgets/menu_widgets.dart';
import 'package:ashesi_premier_league/pages/pl/fixtures.dart';
import 'package:ashesi_premier_league/pages/pl/players.dart';
import 'package:ashesi_premier_league/pages/pl/results.dart';
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

        NextFixture(
          onTap: (){}, 
          team1LogoLink: "https://assets.stickpng.com/images/580b57fcd9996e24bc43c4e1.png",
          team2LogoLink: "https://cdn.freebiesupply.com/images/large/2x/manchester-city-logo-png-transparent.png",
        ),

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
          title: "Tables", 
          iconData: Icons.table_chart,
          onTap: () {}
        ),

        const SizedBox(height: 20),

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
          onTap: () {}
        ),

        MenuListTile(
          title: "Coaches", 
          iconData: Icons.person,
          onTap: () {}
        ),

        const SizedBox(height: 20,),

        MenuListTile(
          title: "News", 
          iconData: Icons.newspaper,
          onTap: () {}
        ),

        MenuListTile(
          title: "Videos", 
          iconData: Icons.movie,
          onTap: () {}
        ),
      ]
    );
  }
}