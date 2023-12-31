import 'package:ashesi_premier_league/helper/widgets/app_bar.dart';
import 'package:ashesi_premier_league/helper/widgets/menu_widgets.dart';
import 'package:ashesi_premier_league/helper/widgets/text.dart';
import 'package:flutter/material.dart';


class ViewPlayer extends StatefulWidget {

  const ViewPlayer(
    {
      super.key,
      required this.player
    }
  );

  final Map<String,dynamic> player;

  @override
  ViewPlayerState createState() => ViewPlayerState();

}

class ViewPlayerState extends State<ViewPlayer> {


  @override
  Widget build (BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: RegularAppBar(
          prevContext: context,
          title: "${widget.player['first_name']} ${widget.player['last_name']}",
          color: Color(int.parse('0xFF${widget.player['team']['color']}'))
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              // getTeams();
            });
          }, 
          child: ListView(
            children: [

              PlayerRectangle(player: widget.player),

              const SizedBox(height: 20),

              PlayerDetailsTile(
                playerDetail: "${widget.player['first_name']} ${widget.player['last_name']}",
                title: "Name", 
                team: widget.player['team'],
              ),

              PlayerDetailsTile(
                playerDetail: widget.player['position']['name'],
                title: "Position", 
                team: widget.player['team'],
              ),

              PlayerDetailsTile(
                playerDetail: widget.player['team']['name'],
                title: "Team", 
                team: widget.player['team'],
              ),

              PlayerDetailsTile(
                playerDetail: widget.player['major'],
                title: "Major", 
                team: widget.player['team'],
              ),

              PlayerDetailsTile(
                playerDetail: widget.player['year_group'],
                title: "Year", 
                team: widget.player['team'],
              ),

              PlayerDetailsTile(
                playerDetail: widget.player['age'].toString(),
                title: "Age", 
                team: widget.player['team'],
              ),
              
              const SizedBox(height: 20),

              const LeftAlignedText(
                text: HeaderText(
                  text: "All-Time Statistics", 
                  color: Colors.white,
                  fontSize: 20,
                )
              ),

              const SizedBox(height: 10),

              PlayerDetailsTile(
                playerDetail: widget.player['no_of_goals_in_history'].toString(),
                title: "Goals", 
                team: widget.player['team'],
              ),

              PlayerDetailsTile(
                playerDetail: 0.toString(),
                title: "Assists", 
                team: widget.player['team'],
              ),

              
            ],
          )
        ),
        backgroundColor:Color(int.parse('0xFF${widget.player['team']['color']}'))
      ),
      
    );

  }

}