import 'get.dart';

String _path = '/team/';


/// This function sends a GET request to the server to get a list of all APL teams.
Future<List<Map<String,dynamic>>> getTeams () async {
  
    return fetchListWithoutQueryParams(
      '${_path}get/',
    );
    
}


/// This function sends a GET request to the server to get a team by id.
Future<Map<String,dynamic>> getTeam (String id) async {
  
    return fetchMap(
      '${_path}get',
      {
        'id': id,
      }
    );
    
}