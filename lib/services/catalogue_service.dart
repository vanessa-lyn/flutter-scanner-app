import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:scan_me/services/dto/album.dart';


const String BASE_URL = 'api.algopix.com';
const String PATH = '/v3/search';

class CatalogueService {

  Future<Album> fetchItem(String barcode) async {

    var params = {
      'keywords': barcode,
      'markets': 'amazon_us',
    };

    final response = await http.get(Uri.https(BASE_URL, PATH, params));

    if (response.statusCode == 200) {
      // TODO replace with CatalogueItem.json...
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed with status code: ${response.statusCode}');
    }
  }

}