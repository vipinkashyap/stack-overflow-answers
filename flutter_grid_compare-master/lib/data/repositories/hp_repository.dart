import 'package:flutter_grid_compare/data/apis/apis.dart';
import 'package:flutter_grid_compare/models/character.dart';

class HpRepository {
  final HpApi _api;
  HpRepository({HpApi? api}) : _api = api ?? HpApi();

  Future<List<Character>> getCharacters() async {
    var characters = await _api.fetchData();
    return characters;
  }
}
