import 'dart:async';

import 'package:addcartui/Data/Model/ItemModel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, int> {
  CartBloc() : super(0);

  @override
  Stream<int> mapEventToState(CartEvent event) async*{
    if(event is DecrementEvent){
      print(event.itemFromEvent.itemID);
      print(state);
      yield state - 1;
    }
  }

  //
  // @override
  // Stream<CartState> mapEventToState(
  //   CartEvent event,
  // ) async* {
  //   if (event is CartLoadingEvent) {
  //     // print(event);
  //     // print(state);
  //     yield* _cartLoadingHandler();
  //   } else if (event is DecrementEvent) {
  //     // print(event);
  //     // print(state);
  //     yield* _cartLoadedHandler(event);
  //   }
  // }
  //
  // Stream<CartState> _cartLoadingHandler() async* {
  //   yield CartLoadingState();
  // }
  //
  // Stream<CartState> _cartLoadedHandler(DecrementEvent event) async* {
  //   if (state is CartLoadingState) {
  //     try {
  //       print(event.itemFromEvent.itemName);
  //       yield DecrementState(itemInState: event.itemFromEvent);
  //       print(DecrementState(itemInState: event.itemFromEvent));
  //     } on Exception {
  //       yield CartErrorState();
  //     }
  //   } else {
  //     print(event.itemFromEvent.itemName);
  //     yield DecrementState(itemInState: event.itemFromEvent);
  //   }
  // }
}
