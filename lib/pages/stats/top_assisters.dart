import 'package:ashesi_premier_league/pages/stats/rankings.dart';
import 'package:ashesi_premier_league/controller/stats.dart';
import 'package:ashesi_premier_league/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class TopAssistersEntry extends StatefulWidget {
  const TopAssistersEntry(
    {
      super.key
    }
  );

  @override
  TopAssistersEntryState createState() => TopAssistersEntryState();
}

class TopAssistersEntryState extends State<TopAssistersEntry> {

  int _currentIndex = 0;

  List<Widget> widgetOptions = [
    const MensTopAssisters(),
    const WomensTopAssisters()
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
          title: "Assists",
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



class MensTopAssisters extends StatefulWidget {

  const MensTopAssisters({
    super.key
  });

  @override
  MensTopAssistersState createState() => MensTopAssistersState();
}

class MensTopAssistersState extends State<MensTopAssisters> {



  @override
  Widget build(BuildContext context) {

    return const RankingsPage(
      stat: "Assists",
      function: getSeasonMensTopAssisters,
      errorTextForTopPlayer: "top assister for this season",
      errorTextForTable: "top assisters for this season",
    );
    
  }
}


class WomensTopAssisters extends StatefulWidget {

  const WomensTopAssisters({
    super.key
  });

  @override
  WomensTopAssistersState createState() => WomensTopAssistersState();
}

class WomensTopAssistersState extends State<WomensTopAssisters> {



  @override
  Widget build(BuildContext context) {

    return const RankingsPage(
      stat: "Assists",
      function: getSeasonWomensTopAssisters,
      errorTextForTopPlayer: "top assister for this season",
      errorTextForTable: "top assisters for this season",
    );



    
  }
}