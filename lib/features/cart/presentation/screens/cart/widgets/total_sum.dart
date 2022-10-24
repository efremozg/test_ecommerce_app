import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test_ecommerce_internship/components/constants.dart';

class TotalSum extends StatelessWidget {
  final String delivery;
  final int total;
  const TotalSum({Key? key, required this.delivery, required this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          color: whiteColor.withOpacity(0.25),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 38.0, right: 38),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                    fontFamily: 'Mark-Pro',
                    fontSize: 15,
                    color: whiteColor,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                '\$${total} us',
                style: const TextStyle(
                    fontFamily: 'Mark-Pro',
                    fontSize: 15,
                    color: whiteColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 38.0, right: 38),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Delivery',
                style: TextStyle(
                    fontFamily: 'Mark-Pro',
                    fontSize: 15,
                    color: whiteColor,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                delivery,
                style: const TextStyle(
                    fontFamily: 'Mark-Pro',
                    fontSize: 15,
                    color: whiteColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          color: whiteColor.withOpacity(0.25),
        ),
      ],
    );
  }
}
