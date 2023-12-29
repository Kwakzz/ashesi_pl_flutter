import 'package:ashesi_premier_league/helper/widgets/app_bar.dart';
import 'package:ashesi_premier_league/helper/widgets/future_builder.dart';
import 'package:ashesi_premier_league/helper/widgets/menu_widgets.dart';
import 'package:ashesi_premier_league/requests/players.dart';
import 'package:flutter/material.dart';


class Coaches extends StatefulWidget {

  const Coaches({
    super.key
  });

  @override
  CoachesState createState() => CoachesState();
}

class CoachesState extends State<Coaches> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: RegularAppBar(
          title: 'Coaches',
          prevContext: context,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              getPlayers();
            });
          },
          child: AppFutureBuilder(
            future: getPlayers(),
            builder: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {

                  final player = data[index];

                  return PlayerListTile(player: player);
                },
              ); 
            },
            errorText: "players",
            reloadPageFunction: () {
              setState(() {
                getPlayers();
              });
            },
          )
        ),
       backgroundColor: Colors.white
      ),
    );
  }
}