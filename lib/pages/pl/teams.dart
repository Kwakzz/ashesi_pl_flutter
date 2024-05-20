import 'package:ashesi_premier_league/controller/teams.dart';
import 'package:ashesi_premier_league/widgets/app_bar.dart';
import 'package:ashesi_premier_league/widgets/future_builder.dart';
import 'package:ashesi_premier_league/widgets/list_tile.dart';
import 'package:flutter/material.dart';


class Teams extends StatefulWidget {
  const Teams({super.key});

  @override
  TeamsState createState() => TeamsState();
}

class TeamsState extends State<Teams> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarWithPrevButton(
          title: 'Teams',
          prevContext: context,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              getTeams();
            });
          },
          child: AppFutureBuilder(
            future: getTeams(),
            builder: (teams) {
              return ListView.builder(
                itemCount: teams.length,
                itemBuilder: (context, index) {

                  final team = teams[index];

                  return TeamListTile(team: team);
                },
              ); 
            },
            errorText: "teams",
            reloadPageFunction: () {
              setState(() {
                getTeams();
              });
            },
          )
        ),
       backgroundColor: Colors.white
      ),
    );
  }
}