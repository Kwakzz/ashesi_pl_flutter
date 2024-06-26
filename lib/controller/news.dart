import 'get.dart';

String _path = '/news-item/';


/// This function sends a GET request to the server to get a list of news items.
Future<List<Map<String,dynamic>>> getNewsItems () async {
  
    return fetchListWithoutQueryParams(
      '${_path}get/',
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