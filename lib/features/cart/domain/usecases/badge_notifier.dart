import 'package:flutter/material.dart';

class BadgeNotify extends ChangeNotifier {
  final List<String> _cartItems = [];
  List<String> get cartItems => _cartItems;

  void newValue(String value) {
    _cartItems.add(value);
    notifyListeners();
  }

  int? checkValue() {
    return _cartItems.length;
  }
}
