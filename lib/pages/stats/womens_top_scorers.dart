import 'package:ashesi_premier_league/pages/stats/stats_table.dart';
import 'package:ashesi_premier_league/requests/stats.dart';
import 'package:flutter/material.dart';

class WomensTopScorers extends StatefulWidget {
  const WomensTopScorers({Key? key}) : super(key: key);

  @override
  WomensTopScorersState createState() => WomensTopScorersState();
}

class WomensTopScorersState extends State<WomensTopScorers> {
  @override
  Widget build(BuildContext context) {
    return const StatsTable(
      function: getSeasonWomensTopScorers,
      errorTextForTopPlayer: "No top scorer for this season",
      errorTextForTable: "No top scorers for this season",
    );
  }
}