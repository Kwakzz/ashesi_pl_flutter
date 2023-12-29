import 'package:ashesi_premier_league/helper/widgets/app_bar.dart';
import 'package:ashesi_premier_league/helper/widgets/menu_widgets.dart';
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

  List<Widget> widgetOptions = [
    Container(),
    Container()
  ];

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
            HomePageResult(
              onTap: (){}, result: widget.result
            ),
            widgetOptions.elementAt(_currentIndex),
          ]
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: bottomNavBarItems,
          selectedLabelStyle: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          selectedIconTheme: const IconThemeData(
            size: 30,
          ),
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color.fromARGB(255, 217, 189, 189),
          backgroundColor: const Color.fromARGB(255, 197, 50, 50)

        ),
      ),
    );
  }

}
     