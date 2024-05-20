import 'get.dart';

String _path = '/player/';


/// This function sends a GET request to the server to get a list of all APL players.
Future<List<Map<String,dynamic>>> getPlayers () async {
  
    return fetchListWithoutQueryParams(
      '${_path}get/',
    );
    
}


/// This function sends a GET request to the server to get a player by id.
Future<Map<String,dynamic>> getPlayer (String id) async {
  
    return fetchMap(
      '${_path}get',
      {
        'id': id,
      }
    );
    
}