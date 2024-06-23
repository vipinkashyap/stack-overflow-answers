import 'package:flutter_list_and_page_app/data/data_api.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class ZooRepository {
  final DataApi _dataApi;

  ZooRepository(DataApi? dataApi)
      : _dataApi = dataApi ?? DataApi(http.Client());

  Future<List<Animal>> fetchData() async {
    var animalData = await _dataApi.getAnimalData();
    return animalData;
  }
}
