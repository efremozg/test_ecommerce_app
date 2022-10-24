import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../../../components/constants.dart';

class MainProductInfo extends StatefulWidget {
  final String cpu, camera, sd, ssd;
  const MainProductInfo(
      {Key? key,
      required this.camera,
      required this.cpu,
      required this.sd,
      required this.ssd})
      : super(key: key);

  @override
  State<MainProductInfo> createState() => _MainProductInfoState();
}

class _MainProductInfoState extends State<MainProductInfo> {
  int selectedIndex = 0;
  List<String> options = ['Shop', 'Details', 'Feature'];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 28,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: options.length,
            itemBuilder: (context, index) => buildChoice(index),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.memory,
                  color: Colors.grey,
                  size: 28,
                ),
                const SizedBox(height: 6),
                Text(
                  widget.cpu,
                  style: const TextStyle(
                      fontFamily: 'Mark-Pro', fontSize: 11, color: Colors.grey),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.grey,
                  size: 28,
                ),
                const SizedBox(height: 6),
                Text(
                  widget.camera,
                  style: const TextStyle(
                      fontFamily: 'Mark-Pro', fontSize: 11, color: Colors.grey),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.confirmation_num_outlined,
                  color: Colors.grey,
                  size: 28,
                ),
                const SizedBox(height: 6),
                Text(
                  widget.sd,
                  style: const TextStyle(
                      fontFamily: 'Mark-Pro', fontSize: 11, color: Colors.grey),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.sd_card_outlined,
                  color: Colors.grey,
                  size: 28,
                ),
                const SizedBox(height: 6),
                Text(
                  widget.ssd,
                  style: const TextStyle(
                      fontFamily: 'Mark-Pro', fontSize: 11, color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget buildChoice(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              options[index],
              style: TextStyle(
                  fontFamily: 'Mark-Pro',
                  fontSize: 20,
                  color: selectedIndex == index
                      ? purpleColor
                      : purpleColor.withOpacity(0.5),
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 1),
            Container(
                width: 70,
                height: 2,
                color:
                    selectedIndex == index ? orangeColor : Colors.transparent)
          ],
        ),
      ),
    );
  }
}
