import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:scan_me/services/dto/catalogue_response.dart';
import 'package:flutter/services.dart' show rootBundle;


const String BASE_URL = 'api.algopix.com';
const String PATH = '/v3/search';
const String LOCAL_CONFIG = 'assets/local_config.json';

class CatalogueService {

  Future<CatalogueResponse> fetchItem(String barcode) async {
    final config = json.decode(
        await rootBundle.loadString(LOCAL_CONFIG)
    );

    print('api_key: ${config['api_key']}');
    print('app_id: ${config['app_id']}');

    var params = {
      'keywords': barcode,
      'markets': 'amazon_us',
    };

    final response = await http.get(
        Uri.https(BASE_URL, PATH, params),
        headers: {
          'accept': 'application/json',
          'X-API-KEY': config['api_key'],
          'X-APP-ID': config['app_id'],
        },
    );
    if (response.statusCode == 200) {
      // TODO replace with CatalogueItem.json...
      return CatalogueResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed with status code: ${response.statusCode}');
    }
  }
}