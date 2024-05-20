import 'package:ashesi_premier_league/controller/season.dart';
import 'package:ashesi_premier_league/util/date_time.dart';
import 'package:ashesi_premier_league/widgets/app_bar.dart';
import 'package:ashesi_premier_league/widgets/card.dart';
import 'package:ashesi_premier_league/widgets/form.dart';
import 'package:ashesi_premier_league/widgets/future_builder.dart';
import 'package:ashesi_premier_league/widgets/text.dart';
import 'package:flutter/material.dart';


class Results extends StatefulWidget {
  const Results({ Key? key }) : super(key: key);

  @override
  ResultsState createState() => ResultsState();
}

class ResultsState extends State<Results> {
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

    AppDropDownFormField seasonDropDown = AppDropDownFormField(
      items: seasonDropdownItems,
      value: _selectedSeason['name'],
      onChanged: (value) {
        setState(() {
          _selectedSeason =
              _seasons.firstWhere((season) => season['name'] == value);
        });
      },
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarWithPrevButton(
          title: 'Results',
          prevContext: context,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            getSeasons().then((seasons) {
              if (seasons.isNotEmpty) {
                setState(() {
                  _seasons = seasons;
                  _selectedSeason = seasons[0];
                });
              }
            });
          },
          backgroundColor: Colors.white,
          child: Column(
            children: [
              AppFutureBuilder(
                future: getSeasons(),
                builder: (seasons) {
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

              // Check if _selectedSeason is available before building the results
              if (_selectedSeason.isNotEmpty)
                Expanded(
                  child: AppFutureBuilder(
                    future: getSeasonResults(_selectedSeason['id']),
                    builder: (results) {
                      if (results.length == 0) {
                        return Center(
                          child: RegularText(
                            text: "No results found.",
                            color: Colors.black,
                          ),
                        );
                      }
                      return ListView.builder(
                        itemCount: results.length,
                        itemBuilder: (context, index) {
                          final result = results[index];

                          // Check if it's the first result or the date has changed
                          if (index == 0 ||
                              result['match_day']['date'] !=
                                  results[index - 1]['match_day']['date']) {
                            // Display the date as a section header
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                Center(
                                  child: HeaderText(
                                    // Format the date as needed
                                    text:
                                        "${formatDateIntoWords(result['match_day']['date']).toString().toUpperCase()} - MATCH DAY ${result['match_day']['number']}",
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                MatchResultCard(result: result)
                              ],
                            );
                          } else {
                            // Just display the result
                            return MatchResultCard(result: result);
                          }
                        },
                      );
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
                    errorText: "results",
                  ),
                )
              else
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
