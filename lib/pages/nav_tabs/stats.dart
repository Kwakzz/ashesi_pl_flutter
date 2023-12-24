import 'package:ashesi_premier_league/helper/widgets/menu_widgets.dart';
import 'package:flutter/material.dart';


class Stats extends StatefulWidget {
  const Stats(
    {
      super.key
    }
  );

  @override
  StatsState createState() => StatsState();
}

class StatsState extends State<Stats> {

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

        const SizedBox(height: 20),

        MenuRectangle(
          playerImageLink: "https://www.footyrenders.com/render/jude-bellingham-1.png",
          title: "GOALS",
          onTap: () {}
        ),

        MenuRectangle(
          playerImageLink: "https://www.footyrenders.com/render/jude-bellingham-1.png",
          title: "ASSISTS",
          onTap: () {}
        ),

        MenuRectangle(
          playerImageLink: "https://www.footyrenders.com/render/jude-bellingham-1.png",
          title: "CLEAN SHEETS",
          onTap: () {}
        ),

        MenuRectangle(
          playerImageLink: "https://www.footyrenders.com/render/jude-bellingham-1.png",
          title: "FOULS",
          onTap: () {}
        ),

      ]
    
    );
  }
}