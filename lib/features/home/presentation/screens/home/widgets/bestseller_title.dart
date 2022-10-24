import 'package:flutter/material.dart';

import '../../../../../../components/constants.dart';

class BestSellerTitle extends StatelessWidget {
  const BestSellerTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17.0, right: 17),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Best Seller',
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Mark-Pro',
                    fontWeight: FontWeight.w700,
                    color: purpleColor),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'see more',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Mark-Pro',
                      fontWeight: FontWeight.w400,
                      color: orangeColor),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
