import 'dart:convert';

import 'package:flutter_test_ecommerce_internship/features/details/data/models/details_model.dart';
import 'package:http/http.dart' as http;

class DetailsDataRemoteService {
  Future<Details?> getDetails() async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return detailsFromJson(json);
    } else {
      throw Exception('Failed to load Hot Sales');
    }
  }
}
