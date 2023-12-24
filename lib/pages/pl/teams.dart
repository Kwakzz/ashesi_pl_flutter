import 'package:ashesi_premier_league/helper/widgets/app_bar.dart';
import 'package:ashesi_premier_league/helper/widgets/future_builder.dart';
import 'package:ashesi_premier_league/helper/widgets/menu_widgets.dart';
import 'package:ashesi_premier_league/requests/teams.dart';
import 'package:flutter/material.dart';


class Teams extends StatefulWidget {
  const Teams({ Key? key }) : super(key: key);

  @override
  TeamsState createState() => TeamsState();
}

class TeamsState extends State<Teams> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: RegularAppBar(
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
            builder: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {

                  final team = data[index];

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