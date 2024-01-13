import 'package:ashesi_premier_league/helper/widgets/app_bar.dart';
import 'package:ashesi_premier_league/helper/widgets/future_builder.dart';
import 'package:ashesi_premier_league/helper/widgets/menu_widgets.dart';
import 'package:ashesi_premier_league/requests/match_event.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultDetails extends StatefulWidget {
  const ResultDetails({
    super.key,
    required this.result,
  });

  final Map<String, dynamic> result;

  @override
  ResultDetailsState createState() => ResultDetailsState();

}

class ResultDetailsState extends State<ResultDetails> {

  int _currentIndex = 0;

  late List<Widget> widgetOptions;

  @override
  void initState() {
    super.initState();
    widgetOptions = [
      MatchEvents(result: widget.result),
      Center(
        child: Text(
          "Lineup not announced",
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    ];
  }


  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    List<BottomNavigationBarItem> bottomNavBarItems = [
      const BottomNavigationBarItem(
        label: "Events",        
        activeIcon: Icon(
          Icons.event,
        ),
        icon: Icon(
          Icons.event,
          color: Color.fromARGB(255, 217, 189, 189),
        ),
      ),
      const BottomNavigationBarItem(
        label: "Lineups",
        activeIcon: Icon(
          Icons.people,
          color: Colors.white
        ),
        icon: Icon(
          Icons.people,
          color: Color.fromARGB(255, 217, 189, 189),
        ),
      ),
      
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: RegularAppBar(
          title: "Match Details",
          prevContext: context
        ),
        body: ListView(
          children:[
            MatchDetailsRectangle(
              result: widget.result
            ),
            widgetOptions.elementAt(_currentIndex),
          ]
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: bottomNavBarItems,
          selectedLabelStyle: GoogleFonts.poppins(
            fontSize: 11,
            fontWeight: FontWeight.w400,
          ),
          unselectedLabelStyle: GoogleFonts.poppins(
            fontSize: 9,
            fontWeight: FontWeight.w400,
          ),
          selectedIconTheme: const IconThemeData(
            size: 22,
          ),
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color.fromARGB(255, 217, 189, 189),
          backgroundColor: const Color.fromARGB(255, 197, 50, 50)

        ),
      ),
    );
  }

}
     

class MatchEvents extends StatefulWidget {

  const MatchEvents({
    super.key,
    required this.result,
  });

  final Map<String, dynamic> result;

  @override
  MatchEventsState createState() => MatchEventsState();

}

class MatchEventsState extends State<MatchEvents> {
  
  Future<List<List<Map<String, dynamic>>>> _getMatchEvents() async {
    List<Map<String, dynamic>> homeTeamEvents =
        await getMatchEventsByTeam(widget.result["id"], widget.result["home_team"]["id"]);
    List<Map<String, dynamic>> awayTeamEvents =
        await getMatchEventsByTeam(widget.result["id"], widget.result["away_team"]["id"]);

    return [homeTeamEvents, awayTeamEvents];
  }

  @override
  Widget build(BuildContext context) {
    return AppFutureBuilder(
      future: _getMatchEvents(),
      errorText: "goals",
      builder: (data) {
        return MatchEventsList(
          result: widget.result,
          teamOneEvents: data[0], 
          teamTwoEvents: data[1],
        );
      },
      reloadPageFunction: () {
        setState(() {
          _getMatchEvents();
        });
      },
    );
  }
}