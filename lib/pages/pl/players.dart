import 'package:ashesi_premier_league/helper/widgets/app_bar.dart';
import 'package:ashesi_premier_league/helper/widgets/future_builder.dart';
import 'package:ashesi_premier_league/helper/widgets/menu_widgets.dart';
import 'package:ashesi_premier_league/requests/players.dart';
import 'package:flutter/material.dart';


class Players extends StatefulWidget {
  const Players({ Key? key }) : super(key: key);

  @override
  PlayersState createState() => PlayersState();
}

class PlayersState extends State<Players> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: RegularAppBar(
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