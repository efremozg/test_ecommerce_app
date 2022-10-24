import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasource/cart_datasource.dart';
import 'cart_events.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartDataRemoteService _cartDataRemoteService;

  CartBloc({required CartDataRemoteService cartDataRemoteService})
      : _cartDataRemoteService = cartDataRemoteService,
        super(CartLoadingState()) {
    on<LoadCartEvent>(_onCartLoaded);
  }

  void _onCartLoaded(LoadCartEvent event, Emitter<CartState> emit) async {
    final cartInfo = await _cartDataRemoteService.getCartInfo();
    final basketInfo = await _cartDataRemoteService.getBasket();
    emit(CartLoadedState(loadedCart: cartInfo, loadedBasket: basketInfo));
  }
}
