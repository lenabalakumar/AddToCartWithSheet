import 'package:addcartui/Data/Model/ItemModel.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable{
  final List<ItemModel> items;

  const Cart({this.items = const <ItemModel>[]});

  @override
  // TODO: implement props
  List<Object?> get props => [items];
}