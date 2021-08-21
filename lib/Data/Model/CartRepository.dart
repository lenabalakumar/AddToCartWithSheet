import 'package:addcartui/Data/Model/ItemModel.dart';

class CartRepository {
  // List<ItemModel> _cartItems = [];
  final _cartItems = <ItemModel>[];

  addToCart(ItemModel item) => _cartItems.add(item);

  removeFromCart(ItemModel item) => _cartItems.remove(item);

  Future<List<ItemModel>> loadCartItems() =>
      Future.delayed(Duration(milliseconds: 1000), () => _cartItems);

  int get cartLength => _cartItems.length;
}

// // addToCart(ItemModel item) {
// //   return _cartItems.add(item);
// // }
