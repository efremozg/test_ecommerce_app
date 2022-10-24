import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test_ecommerce_internship/components/constants.dart';

import 'package:flutter_test_ecommerce_internship/features/cart/domain/usecases/badge_notifier.dart';
import 'package:provider/provider.dart';

class AddToCartButton extends StatefulWidget {
  final String id;
  final String? price;
  const AddToCartButton({Key? key, required this.price, required this.id})
      : super(key: key);

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<BadgeNotify>(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          cart.newValue(widget.id);
          print(cart.checkValue());
        });
      },
      child: Container(
        height: 54,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: orangeColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'Add to Cart    \$${widget.price}.00',
            style: const TextStyle(
                color: whiteColor,
                fontFamily: 'Mark-Pro',
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
