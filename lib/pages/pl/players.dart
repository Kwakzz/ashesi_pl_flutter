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

  Future<List<Map<String,dynamic>>> _getPlayers () async {
    return await getPlayers();
  }

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
              _getPlayers();
            });
          },
          child: AppFutureBuilder(
            future: _getPlayers(),
            builder: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {

                  final player = data[index];

                  return PlayerListTile(player: player);
                },
              ); 
            },
            couldNotLoadText: "players",
            reloadPageFunction: () {
              setState(() {
                _getPlayers();
              });
            },
          )
        ),
       backgroundColor: Colors.white
      ),
    );
  }
}