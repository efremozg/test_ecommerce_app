import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_ecommerce_internship/components/constants.dart';
import 'package:flutter_test_ecommerce_internship/components/loading_widget.dart';
import 'package:flutter_test_ecommerce_internship/features/cart/presentation/bloc/cart_state.dart';
import 'package:flutter_test_ecommerce_internship/features/cart/presentation/screens/cart/widgets/cart_button.dart';
import 'package:flutter_test_ecommerce_internship/features/cart/presentation/screens/cart/widgets/cart_item_card.dart';
import 'package:flutter_test_ecommerce_internship/features/cart/presentation/screens/cart/widgets/total_sum.dart';
import 'package:get_it/get_it.dart';

import '../../../../data/datasource/cart_datasource.dart';
import '../../../../data/models/cart_model.dart';
import '../../../bloc/cart_bloc.dart';
import '../../../bloc/cart_events.dart';

class CartSection extends StatefulWidget {
  final CartBloc _getIt;
  const CartSection(this._getIt, {Key? key}) : super(key: key);

  @override
  State<CartSection> createState() => _CartSectionState();
}

class _CartSectionState extends State<CartSection> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => widget._getIt..add(LoadCartEvent()),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (widget._getIt.state is CartLoadingState) {
            return const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Center(
                child: CircularProgressIndicator(
                  color: orangeColor,
                ),
              ),
            );
          }
          if (state is CartLoadedState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, right: 6, top: 26),
                  child: SizedBox(
                    height: 380,
                    child: ListView.builder(
                        itemCount: state.loadedBasket!.length,
                        itemBuilder: (context, index) => CartItemCard(
                              image: state.loadedBasket![index].images!,
                              price: state.loadedBasket![index].price!,
                              title: state.loadedBasket![index].title!,
                            )),
                  ),
                ),
                TotalSum(
                    delivery: state.loadedCart!.delivery!,
                    total: state.loadedCart!.total!),
                const SizedBox(height: 30),
                const CheckoutButton(),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
