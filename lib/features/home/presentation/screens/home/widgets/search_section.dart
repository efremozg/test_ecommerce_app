import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test_ecommerce_internship/components/constants.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: 300,
            height: 34,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(76, 191, 197, 245).withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(1, 1),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 6.0),
                hintText: 'Search',
                hintStyle:
                    const TextStyle(fontFamily: 'Mark-Pro', fontSize: 15),
                fillColor: whiteColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: orangeColor,
                ),
              ),
            )),
        const SizedBox(
          width: 11,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 34,
            width: 34,
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: orangeColor),
            child: const Icon(
              Icons.qr_code_sharp,
              color: whiteColor,
            ),
          ),
        )
      ],
    );
  }
}
