import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_ecommerce_internship/components/constants.dart';
import 'package:flutter_test_ecommerce_internship/features/home/presentation/screens/home/widgets/filter_options.dart';

class FilterGeo extends StatelessWidget {
  const FilterGeo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, right: 6, left: 17),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 20,
          ),
          const Spacer(),
          const Icon(Icons.location_on_outlined, color: orangeColor),
          const SizedBox(width: 4),
          const Text(
            'Zihuatanejo, Gro',
            style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: 'Mark-Pro',
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
          const Spacer(),
          IconButton(
            splashRadius: 18,
            iconSize: 18,
            onPressed: () {
              showFilterOptions(context);
            },
            icon: SvgPicture.asset(
              'assets/icons/Vector.svg',
            ),
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
