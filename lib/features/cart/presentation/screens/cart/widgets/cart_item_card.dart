import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test_ecommerce_internship/components/constants.dart';

class CartItemCard extends StatelessWidget {
  final String image, title;
  final int price;
  const CartItemCard(
      {Key? key, required this.image, required this.price, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
          width: 300,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover)),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 163,
                    child: Text(
                      title,
                      maxLines: 2,
                      style: const TextStyle(
                          fontFamily: 'Mark-Pro',
                          fontSize: 20,
                          color: whiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    '\$$price',
                    style: const TextStyle(
                        fontFamily: 'Mark-Pro',
                        fontSize: 20,
                        color: orangeColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Container(
                height: 68,
                width: 28,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 40, 40, 67),
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Icon(
                        Icons.remove,
                        color: whiteColor,
                        size: 16,
                      ),
                    ),
                    Text(
                      '1',
                      style: TextStyle(
                          fontFamily: 'Mark-Pro',
                          fontSize: 16,
                          color: whiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 4.0),
                      child: Icon(
                        Icons.add,
                        color: whiteColor,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                  splashRadius: 4,
                  iconSize: 18,
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete_outline,
                    color: whiteColor.withOpacity(0.3),
                  ))
            ],
          )),
    );
  }
}
