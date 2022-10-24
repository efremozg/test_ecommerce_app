import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_ecommerce_internship/components/constants.dart';

import '../features/cart/presentation/screens/cart/cart_screen.dart';

class CustomNavigationBar extends StatefulWidget {
  @override
  CustomNavigationBarState createState() => CustomNavigationBarState();
}

class CustomNavigationBarState extends State<CustomNavigationBar> {
  int selectedIndex = 0;
  List<dynamic> data = [
    const Center(
      child: Text(
        '• Explorer',
        style:
            TextStyle(color: whiteColor, fontFamily: 'Mark-Pro', fontSize: 13),
      ),
    ),
    'assets/icons/VectorShopBag.svg',
    'assets/icons/VectorLike.svg',
    'assets/icons/VectorAccount.svg'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: purpleColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: ListView.builder(
        itemCount: data.length,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (ctx, i) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = i;
                if (i == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()));
                  selectedIndex = 0;
                }
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              width: 62,
              decoration: BoxDecoration(
                border: i == selectedIndex
                    ? const Border(
                        top: BorderSide(width: 3.0, color: orangeColor))
                    : null,
              ),
              child: i == 0
                  ? data[0]
                  : SvgPicture.asset(
                      data[i],
                      fit: BoxFit.scaleDown,
                      color: i == selectedIndex
                          ? Colors.white
                          : Colors.grey.shade800,
                    ),
            ),
          ),
        ),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
