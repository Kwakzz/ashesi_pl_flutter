import 'package:ashesi_premier_league/pages/stats/rankings.dart';
import 'package:ashesi_premier_league/controller/stats.dart';
import 'package:ashesi_premier_league/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class CleanSheetRankingEntry extends StatefulWidget {
  const CleanSheetRankingEntry(
    {
      super.key
    }
  );

  @override
  CleanSheetRankingEntryState createState() => CleanSheetRankingEntryState();
}

class CleanSheetRankingEntryState extends State<CleanSheetRankingEntry> {

  int _currentIndex = 0;

  List<Widget> widgetOptions = [
    const MensCleanSheetRanking(),
    const WomensCleanSheetRanking(),
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
          title: "Clean Sheets",
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


class MensCleanSheetRanking extends StatefulWidget {
  const MensCleanSheetRanking({Key? key}) : super(key: key);

  @override
  MensCleanSheetRankingState createState() => MensCleanSheetRankingState();
}

class MensCleanSheetRankingState extends State<MensCleanSheetRanking> {



  @override
  Widget build(BuildContext context) {

    return const CleanSheetRankingsPage(
      function: getSeasonMensCleanSheetRankings,
      errorTextForTopTeam: "team with the most clean sheets",
      errorTextForTable: "team with the most clean sheets",
    );
    
  }
}


class WomensCleanSheetRanking extends StatefulWidget {
  const WomensCleanSheetRanking({Key? key}) : super(key: key);

  @override
  WomensCleanSheetRankingState createState() => WomensCleanSheetRankingState();
}

class WomensCleanSheetRankingState extends State<WomensCleanSheetRanking> {
  @override
  Widget build(BuildContext context) {

    return const CleanSheetRankingsPage(
      function: getSeasonWomensCleanSheetRankings,
      errorTextForTopTeam: "team with the most clean sheets",
      errorTextForTable: "team with the most clean sheets",
    );
    
  }
}