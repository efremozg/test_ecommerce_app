import 'package:flutter/material.dart';
import 'package:flutter_test_ecommerce_internship/components/constants.dart';
import 'package:flutter_test_ecommerce_internship/features/home/presentation/screens/home/widgets/drop_down_menu.dart';

List<String> brandItems = ['Samsung', 'Apple', 'Xiaomi', 'Huawei'];
List<String> priceItems = [
  '<\$300',
  '\$300-\$500',
  '\$500-\$1000',
  '\$1000-\$4000',
  '\$4000-\$10000'
];
List<String> sizeItems = [
  '3.7 to 4.5 inches',
  '4.5 to 5.5 inches',
  '5.5 to 6.5 inches',
  '>6.5 inches'
];

void showFilterOptions(BuildContext context) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: null,
      context: context,
      builder: (context) {
        return SizedBox(
          height: 375,
          child: Container(
            decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0, left: 41, right: 41),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  topBar(context),
                  const SizedBox(height: 15),
                  const Text(
                    'Brand',
                    style: TextStyle(
                        fontFamily: 'Mark-Pro',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  DropDownList(items: brandItems),
                  const SizedBox(height: 15),
                  const Text(
                    'Price',
                    style: TextStyle(
                        fontFamily: 'Mark-Pro',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  DropDownList(items: priceItems),
                  const SizedBox(height: 15),
                  const Text(
                    'Size',
                    style: TextStyle(
                        fontFamily: 'Mark-Pro',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  DropDownList(items: sizeItems),
                ],
              ),
            ),
          ),
        );
      });
}

Row topBar(BuildContext context) {
  return Row(
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
            child: Icon(Icons.close, color: whiteColor, size: 16),
          ),
        ),
      ),
      const Text(
        'Filter Options',
        style: TextStyle(fontFamily: 'Mark-Pro', fontSize: 18),
      ),
      GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          height: 37,
          width: 86,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: orangeColor),
          child: const Center(
            child: Text(
              'Done',
              style: TextStyle(
                  fontFamily: 'Mark-Pro', fontSize: 18, color: whiteColor),
            ),
          ),
        ),
      ),
    ],
  );
}
