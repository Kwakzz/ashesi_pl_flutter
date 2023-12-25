import 'package:ashesi_premier_league/helper/widgets/form.dart';
import 'package:ashesi_premier_league/helper/widgets/future_builder.dart';
import 'package:ashesi_premier_league/helper/widgets/menu_widgets.dart';
import 'package:ashesi_premier_league/requests/season.dart';
import 'package:ashesi_premier_league/requests/stats.dart';
import 'package:flutter/material.dart';

class StatsTable extends StatefulWidget {

  const StatsTable({
    super.key,
    required this.function,
    required this.errorTextForTopPlayer,
    required this.errorTextForTable,
  });

  final Function function;
  final String errorTextForTopPlayer;
  final String errorTextForTable;

  @override
  StatsTableState createState() => StatsTableState();
}

class StatsTableState extends State<StatsTable> {

  Map<String, dynamic> _selectedSeason = {};
  List<Map<String, dynamic>> _seasons = [];

  @override
  void initState() {
    super.initState();
    getSeasons().then((seasons) {
      if (seasons.isNotEmpty) {
        setState(() {
          _seasons = seasons;
          _selectedSeason = seasons[0];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    List<String> seasonDropdownItems =
        _seasons.map((season) => season['name'] as String).toList();

    AppDropDownButton seasonDropDown = AppDropDownButton(
      items: seasonDropdownItems,
      value: _selectedSeason['name'],
      onChanged: (value) {
        setState(() {
          _selectedSeason =
              _seasons.firstWhere((season) => season['name'] == value);
        });
      },
    );

    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          widget.function(_selectedSeason['id']);
        });
      },
      child: Column(
        children : [

          AppFutureBuilder(
            future: getSeasons(),
            builder: (data) {
              return seasonDropDown;
            },
            reloadPageFunction: () async {
              getSeasons().then((seasons) {
                if (seasons.isNotEmpty) {
                  setState(() {
                    _seasons = seasons;
                    _selectedSeason = seasons[0];
                  });
                }
              });
            },
            errorText: "seasons",
          ),

          if (_selectedSeason.isNotEmpty)
            Expanded(
              child: ListView(
                children: [
                  AppFutureBuilder(
                    future: widget.function(_selectedSeason['id']),
                    builder: (data) {
                      return HighestRankedPlayer(player: data.first);
                    },
                    errorText: widget.errorTextForTopPlayer.toLowerCase(),
                    reloadPageFunction: () {
                      setState(() {
                        getSeasonMensTopScorers(_selectedSeason['id']);
                      });
                    },
                  ),

          
                  AppFutureBuilder(
                    future: widget.function(_selectedSeason['id']),
                    builder: (data) {
                      return PlayerRankings(players: data, stat: "Goals");
                    },
                    errorText: widget.errorTextForTable.toLowerCase(),
                    reloadPageFunction: () {
                      setState(() {
                        getSeasonMensTopScorers(_selectedSeason['id']);
                      });
                    },
                  )
                ]
              )
            )

            else
              const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          

        ]
      )
    );



    
  }
}