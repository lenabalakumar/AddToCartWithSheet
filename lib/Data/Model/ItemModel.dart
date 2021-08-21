class ItemModel {
  int itemID;
  String itemName;
  double itemPrice;
  int itemQuantity;

  ItemModel(
      {required this.itemID,
      required this.itemName,
      required this.itemPrice,
      required this.itemQuantity});
}

var itemOne = ItemModel(
    itemID: 1, itemName: 'Apple', itemPrice: 100.00, itemQuantity: 099);
var itemTwo = ItemModel(
    itemID: 2, itemName: 'Orange', itemPrice: 110.00, itemQuantity: 078);
var itemThree = ItemModel(
    itemID: 3, itemName: 'Papaya', itemPrice: 120.00, itemQuantity: 054);
var itemFour = ItemModel(
    itemID: 4, itemName: 'Avocado', itemPrice: 150.00, itemQuantity: 30);
var itemFive = ItemModel(
    itemID: 5, itemName: 'Mango', itemPrice: 175.00, itemQuantity: 50);

List<ItemModel> itemData = [itemOne, itemTwo, itemThree, itemFour, itemFive];
