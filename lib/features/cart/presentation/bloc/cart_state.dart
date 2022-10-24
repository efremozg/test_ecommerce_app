import 'package:equatable/equatable.dart';

import '../../data/models/cart_model.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

class CartLoadingState extends CartState {
  @override
  List<Object?> get props => [];
}

class CartLoadedState extends CartState {
  final Cart? loadedCart;
  final List<Basket>? loadedBasket;

  const CartLoadedState({required this.loadedBasket, required this.loadedCart});

  @override
  List<Object?> get props => [loadedCart, loadedBasket];
}
