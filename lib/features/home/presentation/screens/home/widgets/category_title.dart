import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test_ecommerce_internship/components/constants.dart';

class SelectCategoryTitle extends StatelessWidget {
  const SelectCategoryTitle({Key? key}) : super(key: key);

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
                'Select Category',
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
                  'view all',
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
