import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test_ecommerce_internship/components/constants.dart';

class DropDownList extends StatefulWidget {
  final List<String> items;
  const DropDownList({Key? key, required this.items}) : super(key: key);

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  String? value;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    value = widget.items[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 37,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: DropdownButton<String>(
            dropdownColor: whiteColor,
            underline: SizedBox(),
            elevation: 1,
            borderRadius: BorderRadius.circular(10),
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
            isExpanded: true,
            value: value,
            items: widget.items.map(buildMenuItems).toList(),
            onChanged: (value) => setState(() => this.value = value)),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItems(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(fontFamily: 'Mark-Pro', fontSize: 18),
      ),
    );
  }
}
