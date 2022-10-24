import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test_ecommerce_internship/features/cart/domain/usecases/badge_notifier.dart';
import 'package:flutter_test_ecommerce_internship/features/cart/presentation/screens/cart/cart_screen.dart';
import 'package:provider/provider.dart';

import '../../../../../../components/constants.dart';

class TopBarNavigation extends StatefulWidget {
  // final int cartItems;
  const TopBarNavigation({Key? key}) : super(key: key);

  @override
  State<TopBarNavigation> createState() => _TopBarNavigationState();
}

class _TopBarNavigationState extends State<TopBarNavigation> {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<BadgeNotify>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 29.0, right: 29, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 37,
              width: 37,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: purpleColor),
              child: const Center(
                child:
                    Icon(Icons.arrow_back_ios_new, color: whiteColor, size: 16),
              ),
            ),
          ),
          const Text(
            'Product Details',
            style: TextStyle(fontFamily: 'Mark-Pro', fontSize: 18),
          ),
          cart.checkValue() != 0
              ? Badge(
                  position: BadgePosition.topEnd(top: 0, end: 4),
                  badgeContent: Consumer<BadgeNotify>(
                    builder: (context, value, child) {
                      return Text(
                        value.checkValue()!.toString(),
                        style: const TextStyle(
                            fontFamily: 'Mark-Pro',
                            fontSize: 8,
                            color: whiteColor),
                      );
                    },
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartScreen()));
                    },
                    child: Container(
                      height: 37,
                      width: 37,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: orangeColor),
                      child: const Center(
                          child: Icon(Icons.shopping_bag_outlined,
                              color: whiteColor, size: 20)),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartScreen()));
                  },
                  child: Container(
                    height: 37,
                    width: 37,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: orangeColor),
                    child: const Center(
                        child: Icon(Icons.shopping_bag_outlined,
                            color: whiteColor, size: 20)),
                  ),
                ),
        ],
      ),
    );
  }
}
