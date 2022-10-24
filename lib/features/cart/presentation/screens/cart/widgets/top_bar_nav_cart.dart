import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test_ecommerce_internship/features/cart/presentation/screens/cart/cart_screen.dart';

import '../../../../../../components/constants.dart';

class TopBarNavigationCart extends StatelessWidget {
  const TopBarNavigationCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Text(
              'Add adress',
              style: TextStyle(fontFamily: 'Mark-Pro', fontSize: 15),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 37,
              width: 37,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: orangeColor),
              child: const Center(
                child: Icon(Icons.location_on_outlined, color: whiteColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
