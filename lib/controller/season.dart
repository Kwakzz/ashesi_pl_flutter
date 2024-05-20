import 'get.dart';

String _path = '/season/';

// This function sends a GET request to the server to get a list of all APL seasons.
Future<List<Map<String,dynamic>>> getSeasons () async {
  
    return fetchListWithoutQueryParams(
      '${_path}get/',
    );
    
}


/// This function sends a GET request to the server to get the list of fixtures. Fixtures are the matches that are yet to be played.
Future<List<Map<String,dynamic>>> getSeasonFixtures () async {
  
    return fetchListWithoutQueryParams(
      '${_path}fixtures/get/',
    );
    
}


/// This function sends a GET request to the server to the list of results in a season. Results are the matches that have been played.
Future<List<Map<String,dynamic>>> getSeasonResults (int seasonId) async {
  
    return fetchListWithQueryParams(
      '${_path}results/get',
      {
        'season_id': seasonId.toString(),
      }
    );
    
}

/// This function sends a GET request to the server to the list of latest results in a season. Results are the matches that have been played.
Future<List<Map<String,dynamic>>> getLatestResults () async {
  
    return fetchListWithoutQueryParams(
      '${_path}results/latest/get/',
    );
    
}