import 'package:ashesi_premier_league/widgets/card.dart';
import 'package:ashesi_premier_league/widgets/social_media.dart';
import 'package:flutter/material.dart';


class More extends StatefulWidget {
  const More(
    {
      super.key
    }
  );

  @override
  MoreState createState() => MoreState();
}

class MoreState extends State<More> {

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
    
    return Scaffold(
    
      body: ListView(
        children: const [

          JoinTheAPLCard(),

          SizedBox(height: 20),

          // MoreListTile(
          //   title: "Our Privacy Policy", 
          //   onTap: () {}
          // ),


          // MoreListTile(
          //   title: "Notifications", 
          //   onTap: () {}
          // ),

          // MoreListTile(
          //   title: "Contact us", 
          //   onTap: () {}
          // ),


          SocialMediaIconsRow()

        ]

      ),
      backgroundColor: const Color.fromARGB(255, 197, 50, 30),
    );
  }
}