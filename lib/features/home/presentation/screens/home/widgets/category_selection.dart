import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_ecommerce_internship/components/constants.dart';
import 'package:flutter_test_ecommerce_internship/features/home/presentation/screens/home/widgets/categories.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: MediaQuery.of(context).size.width - 10,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategory(index),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 71,
              width: 71,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(76, 191, 197, 245).withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 0),
                    ),
                  ],
                  shape: BoxShape.circle,
                  color: selectedIndex == index ? orangeColor : whiteColor),
              child: SvgPicture.asset(
                categories[index].icon,
                fit: BoxFit.scaleDown,
                color: selectedIndex == index ? whiteColor : Colors.grey,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              categories[index].title,
              style: TextStyle(
                  fontFamily: 'Mark-Pro',
                  color: selectedIndex == index ? orangeColor : purpleColor,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
