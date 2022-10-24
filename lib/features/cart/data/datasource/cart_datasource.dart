import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/cart_model.dart';

class CartDataRemoteService {
  Future<Cart> getCartInfo() async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return cartFromJson(json);
    } else {
      throw Exception('Failed to load Cart');
    }
  }

  Future<List<Basket>?> getBasket() async {
    var client = http.Client();

    var uri = Uri.parse(
        'https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return cartFromJson(json).basket;
    } else {
      throw Exception('Failed to load Cart');
    }
  }
}
