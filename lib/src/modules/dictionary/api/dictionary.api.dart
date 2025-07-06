import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pattern_m/src/modules/dictionary/model/word.model/word.model.dart';

class DictionaryApi {
  DictionaryApi(this.client);
  final http.Client client;
  static String baseUrl = 'https://api.dictionaryapi.dev/api/v2/entries/en/';
  final headers = {'Content-Type': 'application/json'};
  
  Future<WordModel?> fetchMeaning(String word) async {
    final url = baseUrl + word;
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return WordModel.fromJson(data.first);
    } else {
      throw Exception('Failed to load data :${response.statusCode}');
    }
  }
}
