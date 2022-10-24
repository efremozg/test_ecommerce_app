import 'dart:convert';

import 'package:flutter_test_ecommerce_internship/features/home/data/models/home_model.dart';
import 'package:http/http.dart' as http;

class HomeDataRemoteService {
  Future<List<HomeStore>?> getHotSales() async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return mainFromJson(json).homeStore!;
    } else {
      throw Exception('Failed to load Hot Sales');
    }
  }

  Future<List<BestSeller>?> getBestSeller() async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return mainFromJson(json).bestSeller;
    } else {
      throw Exception('Failed to load Hot Sales');
    }
  }
}
