import 'package:ashesi_premier_league/pages/stats/stats_table.dart';
import 'package:ashesi_premier_league/requests/stats.dart';
import 'package:flutter/material.dart';

class MensTopAssisters extends StatefulWidget {

  const MensTopAssisters({
    super.key
  });

  @override
  MensTopAssistersState createState() => MensTopAssistersState();
}

class MensTopAssistersState extends State<MensTopAssisters> {



  @override
  Widget build(BuildContext context) {

    return const StatsTable(
      function: getSeasonMensTopAssisters,
      errorTextForTopPlayer: "No top assister for this season",
      errorTextForTable: "No top assisters for this season",
    );



    
  }
}