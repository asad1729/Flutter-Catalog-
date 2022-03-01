import 'package:flutter_catalog/models/catalog.dart';

class CartModel {
  //catalog fields
  late CatalogModel _catalog;

  //collection of ids - store ids of each item
  final List<int> _itemIds = [];

  //get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //GET items in the cart
  List<Item> get items =>
      _itemIds.map((id) => CatalogModel.getById(id)).toList();

  //GET TOTAL PRICE
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //ADD ITEM
  void add(Item item) {
    _itemIds.add(item.id);
  }



  //REMOVE ITEM
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
