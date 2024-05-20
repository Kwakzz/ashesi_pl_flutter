import 'package:ashesi_premier_league/controller/players.dart';
import 'package:ashesi_premier_league/widgets/app_bar.dart';
import 'package:ashesi_premier_league/widgets/future_builder.dart';
import 'package:ashesi_premier_league/widgets/list_tile.dart';
import 'package:flutter/material.dart';


class Players extends StatefulWidget {
  
  const Players({
    super.key
  });

  @override
  PlayersState createState() => PlayersState();
}

class PlayersState extends State<Players> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarWithPrevButton(
          title: 'Players',
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
            builder: (players) {
              return ListView.builder(
                itemCount: players.length,
                itemBuilder: (context, index) {

                  final player = players[index];

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