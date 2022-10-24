import 'package:flutter/material.dart';
import 'package:flutter_test_ecommerce_internship/features/cart/presentation/screens/cart/widgets/cart_section.dart';
import 'package:flutter_test_ecommerce_internship/features/cart/presentation/screens/cart/widgets/cart_title.dart';
import 'package:flutter_test_ecommerce_internship/features/cart/presentation/screens/cart/widgets/top_bar_nav_cart.dart';

import '../../../../../components/constants.dart';
import '../../../../../service_locator.dart';
import '../../bloc/cart_bloc.dart';
import '../../bloc/cart_events.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sl = getIt.get<CartBloc>()..add(LoadCartEvent());
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          const TopBarNavigationCart(),
          const SizedBox(height: 40),
          const CartTitle(),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.2,
                  decoration: const BoxDecoration(
                      color: purpleColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Column(
                    children: [
                      CartSection(sl),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
