// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'card.dart';


class MatchEventsList extends StatelessWidget {

  const MatchEventsList({
    super.key,
    required this.teamOneEvents,
    required this.teamTwoEvents,
    required this.result,
  });

  final List<Map<String, dynamic>> teamOneEvents;
  final List<Map<String, dynamic>> teamTwoEvents;
  final Map<String, dynamic> result;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          const SizedBox(height: 20,),

          Center(
            child: Text (
              result['home_team']['name'].toString().toUpperCase(),
              style: GoogleFonts.poppins(
                color: Color(int.parse('0xFF${result['home_team']['color']}')).withOpacity(1),
                fontStyle: FontStyle.italic,
                fontSize: 25,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
          
          if (teamOneEvents.isNotEmpty)
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: teamOneEvents.length,
              itemBuilder: (context, index) {
                return MatchEventCard(event: teamOneEvents[index]);
              },
            ),
        
          const SizedBox(height: 20,),

          Divider(
            color: Colors.black.withOpacity(0.1),
            thickness: 1,
          ),

          const SizedBox(height: 20,),

          Center(
            child: Text (
              result['away_team']['name'].toString().toUpperCase(),
              style: GoogleFonts.poppins(
                fontStyle: FontStyle.italic,
                color: Color(int.parse('0xFF${result['away_team']['color']}')).withOpacity(1),
                fontSize: 25,
                fontWeight: FontWeight.w700
              ),
            ),
          ),

          if (teamTwoEvents.isNotEmpty)
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: teamTwoEvents.length,
              itemBuilder: (context, index) {
                return MatchEventCard(event: teamTwoEvents[index]);
              },
            ),
        ],
      ),
    );
  }
}


