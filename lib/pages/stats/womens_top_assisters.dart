import 'package:ashesi_premier_league/pages/stats/stats_table.dart';
import 'package:ashesi_premier_league/requests/stats.dart';
import 'package:flutter/material.dart';

class WomensTopAssisters extends StatefulWidget {

  const WomensTopAssisters({
    super.key
  });

  @override
  WomensTopAssistersState createState() => WomensTopAssistersState();
}

class WomensTopAssistersState extends State<WomensTopAssisters> {



  @override
  Widget build(BuildContext context) {

    return const StatsTable(
      function: getSeasonWomensTopAssisters,
      errorTextForTopPlayer: "No top assister for this season",
      errorTextForTable: "No top assisters for this season",
    );



    
  }
}