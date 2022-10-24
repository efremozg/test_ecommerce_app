import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test_ecommerce_internship/components/constants.dart';
import 'package:flutter_test_ecommerce_internship/extensions.dart';

class ColorMemory extends StatefulWidget {
  final List<String>? color;
  final List<String>? capacity;
  const ColorMemory({Key? key, required this.color, required this.capacity})
      : super(key: key);

  @override
  State<ColorMemory> createState() => _ColorMemoryState();
}

class _ColorMemoryState extends State<ColorMemory> {
  int selectedColorIndex = 0;
  int selectedCapacityIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select color and capacity',
          style: TextStyle(
              fontFamily: 'Mark-Pro',
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  width: 100,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.color!.length,
                    itemBuilder: (context, index) => buildColorChoice(index),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  width: 164,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.color!.length,
                    itemBuilder: (context, index) => buildMemoryChoice(index),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildColorChoice(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColorIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          height: 39,
          width: 39,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: widget.color![index].toColor()),
          child: Center(
            child: selectedColorIndex == index
                ? const Icon(
                    Icons.check_outlined,
                    color: whiteColor,
                  )
                : const SizedBox(),
          ),
        ),
      ),
    );
  }

  Widget buildMemoryChoice(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCapacityIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          height: 30,
          width: 71,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: selectedCapacityIndex == index ? orangeColor : whiteColor),
          child: Center(
              child: Text(
            '${widget.capacity![index]} gb',
            style: TextStyle(
                color:
                    selectedCapacityIndex == index ? whiteColor : Colors.grey,
                fontFamily: 'Mark-Pro',
                fontSize: 13,
                fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
