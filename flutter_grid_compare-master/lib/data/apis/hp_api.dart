import 'dart:convert';

import 'package:flutter_grid_compare/models/character.dart';
import 'package:http/http.dart' as http;

class HpApi {
  final Uri _baseUri = Uri.parse('http://hp-api.herokuapp.com/api/characters');
  final http.Client _client;

  HpApi({http.Client? client}) : _client = client ?? http.Client();

  Future<List<Character>> fetchData() async {
    final response = await http.get(_baseUri);
    switch (response.statusCode) {
      case 200:
        var characterLst = <Character>[];
        var body = response.body;
        var decodedBody = jsonDecode(body);
        for (var character in decodedBody) {
          characterLst.add(Character.fromJson(character));
        }
        return characterLst;

      default:
        throw Exception();
    }
  }
}
