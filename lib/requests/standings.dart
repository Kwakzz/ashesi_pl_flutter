import 'get.dart';

String _path = '/standings/';


/// This function retrieves the men's league standings for a particular season.
Future<Map<String,dynamic>> getSeasonMensLeagueStandings (int seasonId) async{

  return fetchMap(
      '${_path}league/mens/get',
      {
        'season_id': seasonId.toString(),
      }
    );
}

/// This function retrieves the women's league standings for a particular season.
Future<Map<String,dynamic>> getSeasonWomensLeagueStandings (int seasonId) async{

  return fetchMap(
      '${_path}league/womens/get',
      {
        'season_id': seasonId.toString(),
      }
    );
}



/// This function retrieves the group standings in a men's FA Cup competition. This is a list because there are multiple groups.
Future<List<Map<String,dynamic>>> getSeasonMensFACupCompStandings (int seasonId) async{

  return fetchListWithQueryParams(
      '${_path}fa_cup/group/mens/get',
      {
        'season_id': seasonId.toString(),
      }
    );
}


Future<dynamic> getMensLatestStandings () async{

  List<Map<String,dynamic>> faCupStandings = await fetchListWithoutQueryParams(
    '${_path}mens/latest/get/',
  );

  Map<String, dynamic> leagueStandings = await fetchMap(
    '${_path}mens/latest/get/',
    {}
  );

  if (faCupStandings.isNotEmpty) {
    return faCupStandings;
  }

  else {
    return leagueStandings;
  }
}


