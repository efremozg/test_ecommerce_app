import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../../../components/constants.dart';

class CartTitle extends StatelessWidget {
  const CartTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 29.0),
      child: Text('My Cart',
          style: TextStyle(
              fontFamily: 'Mark-Pro',
              fontSize: 35,
              color: purpleColor,
              fontWeight: FontWeight.bold)),
    );
  }
}
