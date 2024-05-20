import 'package:ashesi_premier_league/pages/stats/rankings.dart';
import 'package:ashesi_premier_league/controller/stats.dart';
import 'package:ashesi_premier_league/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class TopScorersEntry extends StatefulWidget {
  const TopScorersEntry(
    {
      super.key
    }
  );

  @override
  TopScorersEntryState createState() => TopScorersEntryState();
}

class TopScorersEntryState extends State<TopScorersEntry> {

  int _currentIndex = 0;

  List<Widget> widgetOptions = [
    const MensTopScorers(),
    const WomensTopScorers(),
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
          title: "Goals",
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


class MensTopScorers extends StatefulWidget {
  const MensTopScorers({Key? key}) : super(key: key);

  @override
  MensTopScorersState createState() => MensTopScorersState();
}

class MensTopScorersState extends State<MensTopScorers> {



  @override
  Widget build(BuildContext context) {

    return const RankingsPage(
      function: getSeasonMensTopScorers,
      errorTextForTopPlayer: "top scorer for this season",
      errorTextForTable: "top scorers for this season",
      stat: "Goals",
    );
    
  }
}


class WomensTopScorers extends StatefulWidget {
  const WomensTopScorers({Key? key}) : super(key: key);

  @override
  WomensTopScorersState createState() => WomensTopScorersState();
}

class WomensTopScorersState extends State<WomensTopScorers> {
  @override
  Widget build(BuildContext context) {
    return const RankingsPage(
      stat: "Goals",
      function: getSeasonWomensTopScorers,
      errorTextForTopPlayer: "top scorer for this season",
      errorTextForTable: "top scorers for this season",
    );
  }
}