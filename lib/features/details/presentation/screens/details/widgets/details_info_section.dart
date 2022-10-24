import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test_ecommerce_internship/features/details/presentation/screens/details/widgets/add_to_cart.dart';
import 'package:flutter_test_ecommerce_internship/features/details/presentation/screens/details/widgets/color_memory.dart';
import 'package:flutter_test_ecommerce_internship/features/details/presentation/screens/details/widgets/shop_details_feature_section.dart';
import 'package:flutter_test_ecommerce_internship/features/details/presentation/screens/details/widgets/title_rating_favorites.dart';

import '../../../../data/datasource/details_datasource.dart';
import '../../../../data/models/details_model.dart';

class DetailsInfoSection extends StatefulWidget {
  final String title, camera, cpu, ssd, sd, price, id;
  final bool isFavorite;
  final double rating;
  final List<String>? color;
  final List<String>? capacity;
  const DetailsInfoSection(
      {Key? key,
      required this.title,
      required this.camera,
      required this.cpu,
      required this.ssd,
      required this.sd,
      required this.price,
      required this.id,
      required this.isFavorite,
      required this.rating,
      this.color,
      this.capacity})
      : super(key: key);

  @override
  State<DetailsInfoSection> createState() => _DetailsInfoSectionState();
}

class _DetailsInfoSectionState extends State<DetailsInfoSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 28.0, left: 38, right: 38, bottom: 28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleRatingFavourites(
              title: widget.title,
              isFavorite: widget.isFavorite,
              rating: widget.rating),
          const SizedBox(height: 15),
          MainProductInfo(
            camera: widget.camera,
            cpu: widget.cpu,
            ssd: widget.ssd,
            sd: widget.sd,
          ),
          const SizedBox(height: 15),
          ColorMemory(color: widget.color, capacity: widget.capacity),
          const SizedBox(height: 20),
          AddToCartButton(
            price: widget.price.toString(),
            id: widget.id,
          )
        ],
      ),
    );
  }
}
