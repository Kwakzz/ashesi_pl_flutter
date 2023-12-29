import 'package:ashesi_premier_league/helper/widgets/app_bar.dart';
import 'package:ashesi_premier_league/helper/widgets/menu_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ViewTeam extends StatefulWidget {

  const ViewTeam(
    {
      super.key,
      required this.team
    }
  );

  final Map<String,dynamic> team;

  @override
  ViewTeamState createState() => ViewTeamState();

}

class ViewTeamState extends State<ViewTeam> {


  @override
  Widget build (BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: RegularAppBar(
          prevContext: context,
          title: widget.team['name'],   
          color: Color(int.parse('0xFF${widget.team['color']}'))
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              // getTeams();
            });
          }, 
          child: ListView(
            children: [
              TeamRectangle(team: widget.team),

              const SizedBox(height: 20),

              ViewTeamListTile(
                title: "Squad", 
                onTap: () {},
                iconData: Icons.group,
                team: widget.team,
              ),

              ViewTeamListTile(
                title: "Stats", 
                onTap: () {},
                iconData: Icons.bar_chart,
                team: widget.team,
              ),

              ViewTeamListTile(
                title: "Twitter", 
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => WebPage(
                        pageName: "X",
                        url: widget.team['twitter_url'],
                      )
                    )
                  );
                },
                iconData: FontAwesomeIcons.twitter,
                team: widget.team,
              ),
            ],
          )
        ),
        backgroundColor:Color(int.parse('0xFF${widget.team['color']}'))
      ),
      
    );

  }

}