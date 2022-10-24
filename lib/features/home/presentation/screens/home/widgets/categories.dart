import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Category {
  String icon;
  String title;

  Category(this.icon, this.title);
}

List<Category> categories = [
  Category(
    'assets/icons/GroupPhone.svg',
    'Phone',
  ),
  Category(
    'assets/icons/VectorComputer.svg',
    'Computer',
  ),
  Category(
    'assets/icons/VectorHealth2.svg',
    'Health',
  ),
  Category(
    'assets/icons/VectorBooks.svg',
    'Books',
  ),
  Category(
    'assets/icons/VectorBooks.svg',
    'More Books',
  ),
];
