import 'dart:convert' as convert;

import 'package:br/properties/constants.dart';
import 'package:http/http.dart' as http;

class ComicsRepository {

  Future<Map> getComics(int offset) async {
    http.Response response;
    var param = {'ts' : '1', 'apikey': key, 'hash': hash, 'offset': offset.toString(), 'hasDigitalIssue': 'true'};
    var url = Uri.https(baseUrl, comicsUri, param);

    response = await http.get(url);
    if (response.statusCode == 200) {
      return convert.json.decode(response.body);
    }

    return null;
  }




}