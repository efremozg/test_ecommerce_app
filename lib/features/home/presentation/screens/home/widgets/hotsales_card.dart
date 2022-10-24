import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test_ecommerce_internship/components/constants.dart';

class HotSalesCard extends StatelessWidget {
  bool? isNew;
  String? title;
  String? subtitle;
  String? picture;
  HotSalesCard(
      {Key? key,
      required this.isNew,
      required this.title,
      required this.subtitle,
      required this.picture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17.0, right: 17),
      child: Container(
        height: 182,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
        ),
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(picture!), fit: BoxFit.cover)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isNew == true
                  ? Padding(
                      padding: const EdgeInsets.only(left: 24.0, top: 20),
                      child: Container(
                        height: 27,
                        width: 27,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: orangeColor,
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              'New',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: whiteColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(
                      height: 47,
                    ),
              Padding(
                padding: EdgeInsets.only(left: 24.0, top: 20),
                child: Text(
                  title!,
                  style: TextStyle(fontSize: 25, color: whiteColor),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.0, top: 5),
                child: Text(
                  subtitle!,
                  style: TextStyle(fontSize: 11, color: whiteColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 20),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 23,
                    width: 98,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: whiteColor,
                    ),
                    child: const Center(
                      child: Text('Buy now!'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
