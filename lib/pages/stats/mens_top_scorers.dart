import 'package:ashesi_premier_league/pages/stats/stats_table.dart';
import 'package:ashesi_premier_league/requests/stats.dart';
import 'package:flutter/material.dart';

class MensTopScorers extends StatefulWidget {
  const MensTopScorers({Key? key}) : super(key: key);

  @override
  MensTopScorersState createState() => MensTopScorersState();
}

class MensTopScorersState extends State<MensTopScorers> {



  @override
  Widget build(BuildContext context) {

    return const StatsTable(
      function: getSeasonMensTopScorers,
      errorTextForTopPlayer: "No top scorer for this season",
      errorTextForTable: "No top scorers for this season",
    );



    
  }
}