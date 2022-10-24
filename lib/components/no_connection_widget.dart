import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'constants.dart';

class NoConnectionWidget extends StatelessWidget {
  const NoConnectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            height: 80,
            child: Center(
              child: Column(
                children: const [
                  Center(
                    child: CircularProgressIndicator(
                      color: orangeColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('No Internet :('),
                ],
              ),
            )),
      ),
    );
  }
}
