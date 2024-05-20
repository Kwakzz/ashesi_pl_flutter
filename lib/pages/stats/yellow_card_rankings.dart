import 'package:ashesi_premier_league/pages/stats/rankings.dart';
import 'package:ashesi_premier_league/controller/stats.dart';
import 'package:ashesi_premier_league/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class YellowCardRankingEntry extends StatefulWidget {
  const YellowCardRankingEntry(
    {
      super.key
    }
  );

  @override
  YellowCardRankingEntryState createState() => YellowCardRankingEntryState();
}

class YellowCardRankingEntryState extends State<YellowCardRankingEntry> {

  int _currentIndex = 0;

  List<Widget> widgetOptions = [
    const MensYellowCardRankings(),
    const WomensYellowCardRankings(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
    
    List<BottomNavigationBarItem> bottomNavBarItems = [
      const BottomNavigationBarItem(
        label: "Men",        
        activeIcon: Icon(
          Icons.male,
        ),
        icon: Icon(
          Icons.male,
          color: Color.fromARGB(255, 217, 189, 189),
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
          title: "Yellow Cards",
          prevContext: context
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
          unselectedItemColor: const Color.fromARGB(255, 217, 189, 189),
          backgroundColor: const Color.fromARGB(255, 197, 50, 50)

        ),
      ),
    );
  }

}


class MensYellowCardRankings extends StatefulWidget {
  const MensYellowCardRankings({Key? key}) : super(key: key);

  @override
  MensYellowCardRankingsState createState() => MensYellowCardRankingsState();
}

class MensYellowCardRankingsState extends State<MensYellowCardRankings> {



  @override
  Widget build(BuildContext context) {

    return const RankingsPage(
      stat: "Cards",
      function: getSeasonMensYellowCardRankings,
      errorTextForTopPlayer: "player with the most yellow cards",
      errorTextForTable: "players with the most yellow cards",
    );
    
  }
}


class WomensYellowCardRankings extends StatefulWidget {

  const WomensYellowCardRankings({
    super.key
  });

  @override
  WomensYellowCardRankingsState createState() => WomensYellowCardRankingsState();
}

class WomensYellowCardRankingsState extends State<WomensYellowCardRankings> {

  @override
  Widget build(BuildContext context) {

    return const RankingsPage(
      stat: "Cards",
      function: getSeasonWomensYellowCardRankings,
      errorTextForTopPlayer: "player with the most yellow cards",
      errorTextForTable: "players with the most yellow cards",
    );
    
  }
}