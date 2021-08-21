part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartLoadingState extends CartState {}

class DecrementState extends CartState {
  final ItemModel itemInState;

  DecrementState({required this.itemInState});

  int get counter => itemInState.itemQuantity--;
}

class CartErrorState extends CartState{}