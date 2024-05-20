import 'package:ashesi_premier_league/widgets/app_bar.dart';
import 'package:ashesi_premier_league/widgets/list_tile.dart';
import 'package:flutter/material.dart';


class ViewCoach extends StatefulWidget {

  const ViewCoach(
    {
      super.key,
      required this.coach
    }
  );

  final Map<String,dynamic> coach;

  @override
  ViewCoachState createState() => ViewCoachState();

}

class ViewCoachState extends State<ViewCoach> {


  @override
  Widget build (BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarWithPrevButton(
          prevContext: context,
          title: "${widget.coach['first_name']} ${widget.coach['last_name']}",
          color: Color(int.parse('0xFF${widget.coach['team']['color']}'))
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              // getTeams();
            });
          }, 
          child: ListView(
            children: [

              const SizedBox(height: 20),

              PlayerDetailsTile(
                playerDetail: "${widget.coach['first_name']} ${widget.coach['last_name']}",
                title: "Name", 
                team: widget.coach['team'],
              ),

              PlayerDetailsTile(
                playerDetail: widget.coach['team']['name'],
                title: "Team", 
                team: widget.coach['team'],
              ),

              PlayerDetailsTile(
                playerDetail: widget.coach['gender'],
                title: "Gender", 
                team: widget.coach['team'],
              ),  

              
              const SizedBox(height: 20),

            ],
          )
        ),
        backgroundColor:Color(int.parse('0xFF${widget.coach['team']['color']}'))
      ),
      
    );

  }

}