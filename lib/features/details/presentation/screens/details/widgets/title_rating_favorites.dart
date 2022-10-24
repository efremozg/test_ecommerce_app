import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_test_ecommerce_internship/components/constants.dart';

class TitleRatingFavourites extends StatelessWidget {
  final String? title;
  final double? rating;
  final bool isFavorite;
  const TitleRatingFavourites(
      {Key? key,
      required this.title,
      required this.isFavorite,
      required this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title!,
              style: const TextStyle(fontFamily: 'Mark-Pro', fontSize: 24),
            ),
            Container(
              height: 33,
              width: 37,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: purpleColor,
              ),
              child: Center(
                  child: isFavorite
                      ? const Icon(Icons.favorite, color: whiteColor, size: 16)
                      : const Icon(Icons.favorite_border,
                          color: whiteColor, size: 16)),
            )
          ],
        ),
        const SizedBox(height: 4),
        RatingBarIndicator(
          rating: rating!,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: Colors.yellow,
          ),
          itemCount: 5,
          itemSize: 28.0,
          unratedColor: Colors.yellow.withAlpha(50),
        ),
      ],
    );
  }
}
