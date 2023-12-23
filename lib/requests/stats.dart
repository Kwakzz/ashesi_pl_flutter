import 'get.dart';

String _path = '/season/stats/';

/// This function sends a GET request to the server to get a list of the top scorers in a season.
Future<List<Map<String,dynamic>>> getSeasonTopScorers (int seasonId) async {
  
    return fetchListWithQueryParams(
      '${_path}top_scorers/get',
      {
        'season_id': seasonId.toString(),
      }
    );
    
}

/// This function sends a GET request to the server to get a list of the top assisters in a season.
Future<List<Map<String,dynamic>>> getSeasonTopAssisters (int seasonId) async {
  
    return fetchListWithQueryParams(
      '${_path}top_assisters/get',
      {
        'season_id': seasonId.toString(),
      }
    );
    
}