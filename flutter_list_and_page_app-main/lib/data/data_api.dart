import 'dart:convert';
import 'dart:developer';

import 'package:flutter_list_and_page_app/models/models.dart';
import 'package:http/http.dart' as http;

class DataApi {
  final http.Client _httpClient;
  DataApi(http.Client? httpClient) : _httpClient = httpClient ?? http.Client();

  Future<List<Animal>> getAnimalData() async {
    var response = await _httpClient
        .get(Uri.parse('https://zoo-animal-api.herokuapp.com/animals/rand/10'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((a) => Animal.fromJson(a)).toList();
    } else {
      throw Exception();
    }
  }
}
