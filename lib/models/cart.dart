
import 'package:code_with_flutter/models/cart.dart';
import 'package:code_with_flutter/models/catalog.dart';

class CartModel{

  static final cartModel = CartModel._internal();
  CartModel._internal();

  factory CartModel() => cartModel;


  late CatalogModel _catalog;
  final List<int> _itemIds = [];
  CatalogModel get catalog => _catalog;
  set catalog(CatalogModel newCatalog){
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get Items in The Cart
List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // Get Total Price

num get totalPrice => items.fold(0, (total, current) => total+ current.price);

// Add Item
void add(Item item){
  _itemIds.add(item.id.toInt());
}

void remove(Item item){
  _itemIds.remove(item.id);
}

//Remove Item


}