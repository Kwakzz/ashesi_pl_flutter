import 'get.dart';

String _path = '/goal/';

/// This function sends a GET request to the server to get a list of the goals a team has scored in a match.
Future<List<Map<String,dynamic>>> getMatchGoalsByTeam (int matchId, int teamId) async {
  
    return fetchListWithQueryParams(
      '${_path}get_by_team',
      {
        'match_id': matchId.toString(),
        'team_id': teamId.toString(),
      }
    );
    
}

