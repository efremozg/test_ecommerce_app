import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test_ecommerce_internship/components/constants.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 38.0, right: 38, bottom: 38),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 54,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: orangeColor),
        child: const Center(
          child: Text('Checkout',
              style: TextStyle(
                  fontFamily: 'Mark-Pro',
                  fontSize: 20,
                  color: whiteColor,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
