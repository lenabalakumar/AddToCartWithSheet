part of 'add_to_cart_bloc.dart';

@immutable
abstract class AddToCartEvent {}

class AddToCartLoading extends AddToCartEvent {}

class AddItemToCart extends AddToCartEvent{
  final ItemModel item;

  AddItemToCart({required this.item});
}

class RemoveItemFromCart extends AddToCartEvent{
  final ItemModel item;

  RemoveItemFromCart({required this.item});
}
