import 'package:ashesi_premier_league/widgets/app_bar.dart';
import 'package:ashesi_premier_league/widgets/card.dart';
import 'package:ashesi_premier_league/widgets/future_builder.dart';
import 'package:ashesi_premier_league/widgets/list_tile.dart';
import 'package:ashesi_premier_league/widgets/text.dart';
import 'package:ashesi_premier_league/controller/teams.dart';
import 'package:ashesi_premier_league/widgets/web.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class ViewTeam extends StatefulWidget {

  const ViewTeam(
    {
      super.key,
      required this.team
    }
  );

  final Map<String,dynamic> team;

  @override
  ViewTeamState createState() => ViewTeamState();

}

class ViewTeamState extends State<ViewTeam> {


  @override
  Widget build (BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarWithPrevButton(
          prevContext: context,
          title: widget.team['name'],   
          color: Color(int.parse('0xFF${widget.team['color']}'))
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              // getTeams();
            });
          }, 
          child: ListView(
            children: [
              TeamCard(team: widget.team),

              const SizedBox(height: 20),

              ViewTeamListTile(
                title: "Squad", 
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => TeamSquad(
                        team: widget.team,
                      )
                    )
                  );
                },
                iconData: Icons.group,
                team: widget.team,
              ),

              ViewTeamListTile(
                title: "Stats", 
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => TeamStats(
                        team: widget.team,
                      )
                    )
                  );
                },
                iconData: Icons.bar_chart,
                team: widget.team,
              ),

              ViewTeamListTile(
                title: "Twitter", 
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => WebPage(
                        pageName: "X",
                        url: widget.team['twitter_url'],
                      )
                    )
                  );
                },
                iconData: FontAwesomeIcons.twitter,
                team: widget.team,
              ),
            ],
          )
        ),
        backgroundColor:Color(int.parse('0xFF${widget.team['color']}'))
      ),
      
    );

  }

}


// ignore: must_be_immutable
class TeamSquad extends StatefulWidget {

  TeamSquad({
    required this.team,
    super.key
  });

  Map<String, dynamic> team;

  @override
  TeamSquadState createState() => TeamSquadState();


}


class TeamSquadState extends State<TeamSquad> {

  int _currentIndex = 0;
  List<Widget> widgetOptions = <Widget>[];

  @override
  void initState() {
    super.initState();
    widgetOptions = <Widget>[
      MensSquad(team: widget.team),
      WomensSquad(team: widget.team),
    ];
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build (BuildContext context) {

    List<BottomNavigationBarItem> bottomNavBarItems = [
      const BottomNavigationBarItem(
        label: "Men",        
        activeIcon: Icon(
          Icons.male,
        ),
        icon: Icon(
          Icons.male,
          color: Colors.grey
        ),
      ),
      const BottomNavigationBarItem(
        label: "Women",
        activeIcon: Icon(
          Icons.female,
          color: Colors.white
        ),
        icon: Icon(
          Icons.female,
          color: Color.fromARGB(255, 217, 189, 189),
        ),
      ),
      
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarWithPrevButton(
          title: "Squad",
          prevContext: context,
          color: Color(int.parse('0xFF${widget.team['color']}')),
        ),
        body: widgetOptions.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: bottomNavBarItems,
          selectedLabelStyle: GoogleFonts.poppins(
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: GoogleFonts.poppins(
            fontSize: 9,
            fontWeight: FontWeight.w500,
          ),
          selectedIconTheme: const IconThemeData(
            size: 22,
          ),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          backgroundColor: Color(int.parse('0xFF${widget.team['color']}')),

        ),
      ),
    );
  }


}


// ignore: must_be_immutable
class Squad extends StatefulWidget {

  Squad({
    required this.getFunction,
    super.key
  });

  Future<List<Map<String, dynamic>>> getFunction;

  @override
  SquadState createState() => SquadState();

}


class SquadState extends State<Squad> {

  @override
  Widget build (BuildContext context) {

    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          widget.getFunction;
        });
      }, 
      child: AppFutureBuilder(
        future: widget.getFunction,
        builder: (players) {
          return ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, index) {
              final player = players[index];
              return SquadListTile(
                player: player
              );
            },
          ); 
        },
        reloadPageFunction: () {
          setState(() {
            widget.getFunction;
          });
        },
        errorText: "players",
      ),
    );
  }

}


// ignore: must_be_immutable
class MensSquad extends StatefulWidget {

  MensSquad({
    required this.team,
    super.key
  });

  Map<String, dynamic> team;

  @override
  MensSquadState createState() => MensSquadState();

}


class MensSquadState extends State<MensSquad> {

  @override
  Widget build (BuildContext context) {

    return Squad(
      getFunction: getMensPlayersInTeam(widget.team['id']),
    );
  }

}


// ignore: must_be_immutable
class WomensSquad extends StatefulWidget {

  WomensSquad({
    required this.team,
    super.key
  });

  Map<String, dynamic> team;

  @override
  WomensSquadState createState() => WomensSquadState();

}


class WomensSquadState extends State<WomensSquad> {

  @override
  Widget build (BuildContext context) {

    return Squad(
      getFunction: getWomensPlayersInTeam(widget.team['id']),
    );
  }

}


// ignore: must_be_immutable
class TeamStats extends StatefulWidget {

  TeamStats({
    required this.team,
    super.key
  });

  Map<String, dynamic> team;

  @override
  TeamStatsState createState() => TeamStatsState();

}

class TeamStatsState extends State<TeamStats> {

  @override
  Widget build (BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarWithPrevButton(
          title: "All-Time Stats",
          prevContext: context,
          color: Color(int.parse('0xFF${widget.team['color']}')),
        ),
        body: ListView(
          children: [
            RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  // getTeams();
                });
              }, 
              child: AppFutureBuilder(
                future: getTeamStats(widget.team['id']),
                builder: (teamStats) {
                  return Column(
                    children: [
                      TeamStatsTile(
                        stat: teamStats['wins'].toString(),
                        title: "Wins",
                        team: widget.team,
                      ),

                      TeamStatsTile(
                        stat: teamStats['losses'].toString(), 
                        title: "Losses",
                        team: widget.team,
                      ),

                      TeamStatsTile(
                        stat: teamStats['draws'].toString(),
                        title: "Draws",
                        team: widget.team,
                      ),

                      TeamStatsTile(
                        stat: teamStats['goals_scored'].toString(),
                        title: "Goals Scored", 
                        team: widget.team,
                      ),

                      TeamStatsTile(
                        stat: teamStats['goals_conceded'].toString(),
                        title: "Goals Conceded", 
                        team: widget.team,
                      ),
                    ],
                  );
                },
                reloadPageFunction: () {
                  setState(() {
                    getTeamStats(widget.team['id']);
                  });
                },
                errorText: "team stats",
                errorTextColor: Colors.white,
              )
            ),


            const SizedBox(height: 20),

            const LeftAlignedText(
              text: SubHeaderText(
                text: "Note that these stats are for both men's and women's teams (that's if the team has a men's and women's side)", 
                color: Colors.white,
              )
            ),
          ],
        ),
        backgroundColor:Color(int.parse('0xFF${widget.team['color']}'))
      ),


      
    );
  }

}