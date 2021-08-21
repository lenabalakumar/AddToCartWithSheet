import 'dart:async';

import 'package:addcartui/Data/Model/Cart.dart';
import 'package:addcartui/Data/Model/CartRepository.dart';
import 'package:addcartui/Data/Model/ItemModel.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'add_to_cart_event.dart';
part 'add_to_cart_state.dart';

class AddToCartBloc extends Bloc<AddToCartEvent, AddToCartState> {
  AddToCartBloc() : super(AddToCartInitial());

  CartRepository cartRepository = new CartRepository();

  @override
  Stream<AddToCartState> mapEventToState(
    AddToCartEvent event,
  ) async* {
    if (event is AddToCartLoading) {
      yield* _cartLoadingHandler();
    } else if (event is AddItemToCart) {
      yield* _addItemToCartHandler(event, state);
    } else if (event is RemoveItemFromCart) {
      yield* _removeItemFromCartHandler(event, state);
    }
  }

  Stream<AddToCartState> _addItemToCartHandler(
      AddItemToCart event, AddToCartState state) async* {
    if (state is AddToCartLoaded) {
      cartRepository.addToCart(event.item);
      yield AddToCartLoaded(
        items: Cart(
          items: [...state.items.items, event.item],
        ),
      );
    }
  }

  Stream<AddToCartState> _cartLoadingHandler() async* {
    if (state is AddToCartInitial) {
      try {
        final items = await cartRepository.loadCartItems();
        print('items $items');
        yield AddToCartLoaded(
          items: Cart(
            items: [...items],
          ),
        );
      } on Exception {}
    }
  }

  Stream<AddToCartState> _removeItemFromCartHandler(
      RemoveItemFromCart event, AddToCartState state) async* {
    print(event.item.itemName);
    cartRepository.removeFromCart(event.item);
    final items = await cartRepository.loadCartItems();
    yield AddToCartLoaded(
      items: Cart(
        items: [...items],
      ),
    );
  }
}
