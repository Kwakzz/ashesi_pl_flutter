import 'package:ashesi_premier_league/helper/widgets/form.dart';
import 'package:ashesi_premier_league/helper/widgets/future_builder.dart';
import 'package:ashesi_premier_league/helper/widgets/menu_widgets.dart';
import 'package:ashesi_premier_league/requests/season.dart';
import 'package:flutter/material.dart';

class RankingsPage extends StatefulWidget {

  const RankingsPage({
    super.key,
    required this.function,
    required this.errorTextForTopPlayer,
    required this.errorTextForTable,
    required this.stat
  });

  final Function function;
  final String errorTextForTopPlayer;
  final String errorTextForTable;
  final String stat;

  @override
  RankingsPageState createState() => RankingsPageState();
}

class RankingsPageState extends State<RankingsPage> {

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
                        widget.function(_selectedSeason['id']);
                      });
                    },
                  ),

          
                  AppFutureBuilder(
                    future: widget.function(_selectedSeason['id']),
                    builder: (data) {
                      return PlayerRankings(
                        players: data, 
                        stat: widget.stat
                      );
                    },
                    errorText: widget.errorTextForTable.toLowerCase(),
                    reloadPageFunction: () {
                      setState(() {
                        widget.function(_selectedSeason['id']);
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


class CleanSheetRankingsPage extends StatefulWidget {

  const CleanSheetRankingsPage({
    super.key,
    required this.function,
    required this.errorTextForTopTeam,
    required this.errorTextForTable,
  });

  final Function function;
  final String errorTextForTopTeam;
  final String errorTextForTable;

  @override
  CleanSheetRankingsPageState createState() => CleanSheetRankingsPageState();
}

class CleanSheetRankingsPageState extends State<CleanSheetRankingsPage> {

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
                      return HighestRankedTeam(team: data.first);
                    },
                    errorText: widget.errorTextForTopTeam.toLowerCase(),
                    reloadPageFunction: () {
                      setState(() {
                        widget.function(_selectedSeason['id']);
                      });
                    },
                  ),

          
                  AppFutureBuilder(
                    future: widget.function(_selectedSeason['id']),
                    builder: (data) {
                      return CleanSheetRankingsTable(teams: data, stat: "Clean sheets");
                    },
                    errorText: widget.errorTextForTable.toLowerCase(),
                    reloadPageFunction: () {
                      setState(() {
                        widget.function(_selectedSeason['id']);
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