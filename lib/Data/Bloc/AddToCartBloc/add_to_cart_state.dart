part of 'add_to_cart_bloc.dart';

@immutable
abstract class AddToCartState extends Equatable{
  const AddToCartState();
}

class AddToCartInitial extends AddToCartState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddToCartLoaded extends AddToCartState {
  final Cart items;

  const AddToCartLoaded({this.items = const Cart()});

  @override
  // TODO: implement props
  List<Object?> get props => [items];
}



// class CartLoaded extends CartState {
//   const CartLoaded({this.cart = const Cart()});
//
//   final Cart cart;
//
//   @override
//   List<Object> get props => [cart];
// }
