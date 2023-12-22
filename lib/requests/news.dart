import 'get.dart';

String _path = '/news/';


/// This function sends a GET request to the server to get a list of news items.
Future<Map<String,dynamic>> getNewsItems () async {
  
    return fetchMap(
      '${_path}get/',
      {}
    );
    
}


/// This function sends a GET request to the server to get a news item by id.
Future<Map<String,dynamic>> getNewsItem (String id) async {
  
    return fetchMap(
      '${_path}get',
      {
        'id': id,
      }
    );
    
}