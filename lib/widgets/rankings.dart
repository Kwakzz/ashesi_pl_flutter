// ignore_for_file: must_be_immutable
import 'package:ashesi_premier_league/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StandingsTable extends StatelessWidget {

  const StandingsTable(
    {
      super.key,
      required this.standingsTeams,
    }
  );

  final List<dynamic> standingsTeams;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: MediaQuery.of(context).size.width*0.04,
        dividerThickness: 0.4,
        columns: const <DataColumn>[

          // pos
          DataColumn(
            label: HeaderText(
              text: 'Pos',
              color: Color.fromARGB(255, 53, 52, 52),
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),

          // name
          DataColumn(
            label: HeaderText(
              text: 'Club',
              color: Color.fromARGB(255, 53, 52, 52),
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),

          // played
          DataColumn(
            label: HeaderText(
              text: 'PL',
              color: Color.fromARGB(255, 53, 52, 52),
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),

          // wins
          DataColumn(
            label: HeaderText(
              text: 'W',
              color: Color.fromARGB(255, 53, 52, 52),
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),

          // draws      
          DataColumn(
            label: HeaderText(
              text: 'D',
              color: Color.fromARGB(255, 53, 52, 52),
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),

          // losses      
          DataColumn(
            label: HeaderText(
              text: 'L',
              color: Color.fromARGB(255, 53, 52, 52),
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),

          // goal scored      
          DataColumn(
            label: HeaderText(
              text: 'GS',
              color: Color.fromARGB(255, 53, 52, 52),
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),

          // goal conceded      
          DataColumn(
            label: HeaderText(
              text: 'GC',
              color: Color.fromARGB(255, 53, 52, 52),
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),

          // goal difference

          DataColumn(
            label: HeaderText(
              text: 'GD',
              color: Color.fromARGB(255, 53, 52, 52),
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),


          // points      
          DataColumn(
            label: HeaderText(
              text: 'PTS',
              color: Color.fromARGB(255, 53, 52, 52),
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],

        rows: standingsTeams.map((standingsTeam) => DataRow(
            cells: [

              // pos
              DataCell(
                HeaderText(
                  // index + 1 because index starts at 0
                  text: (standingsTeams.indexOf(standingsTeam) + 1).toString(),
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),

              // name
              DataCell(
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  
                  children: [
                    Image.network(
                      standingsTeam['team']['logo_url'],
                      width: 20,
                      height: 20,
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return const Icon(Icons.error, color: Colors.white,);
                      }
                    ),

                    const Text("  "),
                    HeaderText(
                      text: standingsTeam['team']['name_abbreviation'],
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ]

                )
              ),

              // no_played
              DataCell(
                HeaderText(
                  text:standingsTeam['matches_played'].toString(),
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),


              // goals
              DataCell(
                HeaderText(
                  text: standingsTeam['matches_won'].toString(),
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),

              DataCell(
                HeaderText(
                  text: standingsTeam['matches_drawn'].toString(),
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),

              DataCell(
                HeaderText(
                  text: standingsTeam['matches_lost'].toString(),
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),

              DataCell(
                HeaderText(
                  text: standingsTeam['goals_for'].toString(),
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),

              DataCell(
                HeaderText(
                  text: standingsTeam['goals_against'].toString(),
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),

              DataCell(
                HeaderText(
                  text: standingsTeam['goal_difference'].toString(),
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),

              DataCell(
                HeaderText(
                  text: standingsTeam['points'].toString(),
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ).toList(),
      )
    );
  }
  
}


class PlayerRankings extends StatelessWidget {

  const PlayerRankings(
    {
      super.key,
      required this.players,
      required this.stat
    }
  );

  final List<Map<String, dynamic>> players;
  final String stat;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: <DataColumn>[

        // pos
        const DataColumn(
          label: HeaderText(
            text: 'Pos',
            color: Color.fromARGB(255, 53, 52, 52),
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),

        // name
        const DataColumn(
          label: HeaderText(
            text: 'Name',
            color: Color.fromARGB(255, 53, 52, 52),
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),

        // team
        const DataColumn(
          label: HeaderText(
            text: 'Team',
            color: Color.fromARGB(255, 53, 52, 52),
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),

            // goals      
        DataColumn(
          label: HeaderText(
            text: stat,
            color: const Color.fromARGB(255, 53, 52, 52),
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],

      rows: players.map((player) => DataRow(
          cells: [

            // pos
            DataCell(
              HeaderText(
                // index + 1 because index starts at 0
                text: (players.indexOf(player) + 1).toString(),
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),

            // name
            DataCell(
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: player['first_name'].toString().split(' ')[0],
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const TextSpan(
                      text: " ",        
                    ),
                    TextSpan(
                      text: player['last_name'].toString().toUpperCase(),
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // team
            DataCell(
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    player['team_logo_url'],
                    width: 20,
                    height: 20,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return const Icon(Icons.error, color: Colors.white,);
                    }
                  ),
                  HeaderText(
                    text: player['team_name_abbreviation'].toString(),
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ]
              )
            ),

            // stats
            DataCell(
              HeaderText(
                text: (stat == "Goals") ? player['no_of_goals'].toString()
                    : (stat == "Assists") ? player['no_of_assists'].toString()
                    : player['no_of_cards'].toString(),
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )
      ).toList(),
    );
  }
  
}



class CleanSheetRankings extends StatelessWidget {

  const CleanSheetRankings (
    {
      super.key,
      required this.teams,
      required this.stat
    }
  );

  final List<Map<String, dynamic>> teams;
  final String stat;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: <DataColumn>[

        // pos
        const DataColumn(
          label: HeaderText(
            text: 'Pos',
            color: Color.fromARGB(255, 53, 52, 52),
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),


        // team
        const DataColumn(
          label: HeaderText(
            text: 'Team',
            color: Color.fromARGB(255, 53, 52, 52),
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),

            // goals      
        DataColumn(
          label: HeaderText(
            text: stat,
            color: const Color.fromARGB(255, 53, 52, 52),
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],

      rows: teams.map((team) => DataRow(
          cells: [

            // pos
            DataCell(
              HeaderText(
                // index + 1 because index starts at 0
                text: (teams.indexOf(team) + 1).toString(),
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),

            // team
            DataCell(
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    team['team_logo_url'],
                    width: 20,
                    height: 20,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return const Icon(Icons.error, color: Colors.white,);
                    }
                  ),
                  HeaderText(
                    text: team['team_name_abbreviation'].toString(),
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ]
              )
            ),

            // goals
            DataCell(
              HeaderText(
                text: team['no_of_clean_sheets'].toString(),
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )
      ).toList(),
    );
  }
  
}