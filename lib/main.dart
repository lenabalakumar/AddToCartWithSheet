import 'package:addcartui/Data/Bloc/AddToCartBloc/add_to_cart_bloc.dart';
// import 'package:addcartui/Data/Bloc/cart_bloc.dart';
import 'package:addcartui/Data/Model/ItemModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => AddToCartBloc()..add(AddToCartLoading()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ItemView(),
    );
  }
}

class ItemView extends StatelessWidget {
  const ItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: ItemList());
  }
}

class ItemList extends StatelessWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: itemData.map(
            (e) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(e.itemID.toString()),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text(e.itemName),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text(e.itemPrice.toString()),
                          ],
                        ),
                        addToCartButtonWidget(e, context),
                        // addToCartWidget(e, context),
                      ],
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
        TextButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  child: Container(
                    height: 150,
                    child: BlocBuilder<AddToCartBloc, AddToCartState>(
                      bloc: BlocProvider.of<AddToCartBloc>(context),
                      builder: (context, state) {
                        if (state is AddToCartLoaded) {
                          print('state in main : $state');
                          return ListView.builder(
                              itemCount: state.items.items.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Text(state.items.items[index].itemName),
                                    TextButton(
                                      onPressed: () => BlocProvider.of<AddToCartBloc>(context).add(RemoveItemFromCart(item: state.items.items[index])),
                                      child: Text('Remove'),
                                    ),
                                  ],
                                );
                              });
                        } else
                          return Text('hi');
                      },
                    ),
                  ),
                );
              },
            );
          },
          child: Text('Bottom sheet'),
        ),
        // CartList(),
      ],
    );
  }

  Widget addToCartButtonWidget(ItemModel e, BuildContext context) {
    return TextButton(
      onPressed: () => BlocProvider.of<AddToCartBloc>(context).add(
        AddItemToCart(item: e),
      ),
      style: TextButton.styleFrom(backgroundColor: Colors.cyan, elevation: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          'Add to cart',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

//
// class ItemList extends StatelessWidget {
//   const ItemList({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: itemData.length,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             height: 50.0,
//             decoration: BoxDecoration(
//                 color: Colors.cyanAccent,
//                 borderRadius: BorderRadius.circular(8.0)),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Text(itemData[index].itemID.toString()),
//                       SizedBox(
//                         width: 8.0,
//                       ),
//                       Text(itemData[index].itemName),
//                       SizedBox(
//                         width: 8.0,
//                       ),
//                       Text(itemData[index].itemPrice.toString()),
//                     ],
//                   ),
//                   addToCartWidget(itemData[index], context, index),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
// Widget addToCartWidget(ItemModel item, BuildContext context) {
//   return Row(
//     children: [
//       InkWell(
//         onTap: () => BlocProvider.of<CartBloc>(context).add(
//           DecrementEvent(
//             itemFromEvent: item,
//           ),
//         ),
//         child: Container(
//           width: 40,
//           height: 40,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8.0), color: Colors.cyan),
//           child: Center(
//             child: Text(
//               '-',
//               style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),
//       SizedBox(
//         width: 8.0,
//       ),
//       Container(
//         width: 40,
//         height: 40,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8.0), color: Colors.cyan),
//         child: Center(
//           child: Text(
//             '0',
//             style: TextStyle(
//               fontSize: 20,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       SizedBox(
//         width: 8.0,
//       ),
//       Container(
//         width: 40,
//         height: 40,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8.0), color: Colors.cyan),
//         child: Center(
//           child: Text(
//             '+',
//             style: TextStyle(
//               fontSize: 20,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     ],
//   );
// }
//
// class CartList extends StatefulWidget {
//   const CartList({Key? key}) : super(key: key);
//
//   @override
//   _CartListState createState() => _CartListState();
// }
//
// class _CartListState extends State<CartList> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 150,
//       child: BlocBuilder<AddToCartBloc, AddToCartState>(
//         bloc: BlocProvider.of<AddToCartBloc>(context),
//         builder: (context, state) {
//           if (state is AddToCartLoaded) {
//             print('state in main : $state');
//             return ListView.builder(
//                 itemCount: state.items.items.length,
//                 itemBuilder: (context, index) {
//                   return Text(state.items.items[index].itemName);
//                 });
//           } else
//             return Text('hi');
//         },
//       ),
//     );
//   }
// }
