import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'more.dart';
import 'pl.dart';
import 'stats.dart';
import 'latest.dart';


class Entry extends StatefulWidget {
  const Entry(
    {
      super.key
    }
  );

  @override
  EntryState createState() => EntryState();
}

class EntryState extends State<Entry> {

  int _currentIndex = 0;

  List<Widget> widgetOptions = [
    const Latest(),
    const Pl(),
    const Stats(),
    const More()
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
        label: "Latest",        
        activeIcon: Icon(
          Icons.home,
          color: Colors.white
        ),
        icon: Icon(
          Icons.home,
          color: Color.fromARGB(255, 217, 189, 189),
        ),
        backgroundColor: Color.fromARGB(255, 197, 50, 50),
      ),
      const BottomNavigationBarItem(
        label: "APL",
        activeIcon: Icon(
          Icons.sports_soccer,
          color: Colors.white
        ),
        icon: Icon(
          Icons.sports_soccer,
          color: Color.fromARGB(255, 217, 189, 189),
        ),
        backgroundColor: Color.fromARGB(255, 197, 50, 50),
      ),
      const BottomNavigationBarItem(
        label: "Stats",
        activeIcon: Icon(
          Icons.bar_chart,
          color: Colors.white
        ),
        icon: Icon(
          Icons.bar_chart,
          color: Color.fromARGB(255, 217, 189, 189),
        ),
        backgroundColor: Color.fromARGB(255, 197, 50, 50),
      ),
      const BottomNavigationBarItem(
        label: "More",
        activeIcon: Icon(
          Icons.more_horiz,
          color: Colors.white
        ),
        icon: Icon(
          Icons.more_horiz,
          color: Color.fromARGB(255, 217, 189, 189),
        ),
        backgroundColor: Color.fromARGB(255, 197, 50, 50),
      ),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: widgetOptions.elementAt(_currentIndex),
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
  
        ),
      ),
    );
  }

}
