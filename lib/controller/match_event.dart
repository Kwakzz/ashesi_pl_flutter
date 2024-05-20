import 'get.dart';

String _path = '/match_event/';

/// This function sends a GET request to the server to get a list of the events in a match.
Future<List<Map<String,dynamic>>> getMatchEvents (int matchId) async {
  
    return fetchListWithQueryParams(
      '${_path}get',
      {
        'match_id': matchId.toString(),
      }
    );
    
}


/// This function sends a GET request to the server to get a list of the events in a match by team.
Future<List<Map<String,dynamic>>> getMatchEventsByTeam (int matchId, int teamId) async {
  
    return fetchListWithQueryParams(
      '${_path}team/get',
      {
        'match_id': matchId.toString(),
        'team_id': teamId.toString(),
      }
    );
    
}