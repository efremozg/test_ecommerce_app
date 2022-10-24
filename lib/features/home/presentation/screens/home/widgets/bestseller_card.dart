import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test_ecommerce_internship/components/constants.dart';

class BestSellerCard extends StatelessWidget {
  bool? isFavorites;
  String? title;
  int? priceWithoutDiscount;
  int? discountPrice;
  String? picture;
  final VoidCallback onTap;
  BestSellerCard(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.isFavorites,
      required this.picture,
      required this.discountPrice,
      required this.priceWithoutDiscount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 227,
        width: 181,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(76, 191, 197, 245).withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(1, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: whiteColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              SizedBox(
                height: 160,
                width: 168,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Image.network(
                    picture!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                left: 130,
                top: 15,
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 6,
                      // offset: Offset(0, 3),
                    ),
                  ], shape: BoxShape.circle, color: whiteColor),
                  child: Center(
                    child: Icon(
                      isFavorites == true
                          ? Icons.favorite_outline
                          : Icons.favorite,
                      color: orangeColor,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ]),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.only(left: 21.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '\$${priceWithoutDiscount!}',
                    style: const TextStyle(
                        fontFamily: 'Mark-Pro',
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '\$${discountPrice!}',
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontFamily: 'Mark-Pro',
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 21.0),
              child: Text(
                title!,
                style: const TextStyle(
                    fontFamily: 'Mark-Pro',
                    fontSize: 10,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
