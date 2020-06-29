import 'package:flutter/foundation.dart';

class Cart {
  final String id;
  final double price;
  final int quantity;
  final String title;

  Cart({@required this.id,
    @required this.price,
    @required this.quantity,
    @required this.title});
}

class CartProvider with ChangeNotifier {
  Map<String, Cart> _cartMap = {};

  Map<String, Cart> get cartItemList {
    return {
      ..._cartMap
    }; // this will return new map  containing all element of map _cartMap.
  }

  int cartCount() {
    return _cartMap.length;
  }

  double totalAmount() {
    var totalPrice = 0.0;

    _cartMap.forEach((key, value) {
      totalPrice += value.price * value.quantity;
    });

    return totalPrice;
  }

  addCartItem(String title, double price, String productId) {
    if (_cartMap.containsKey(productId)) {
      _cartMap.update(
        productId,
            (existingCartItem) =>
            Cart(
                id: existingCartItem.id,
                title: existingCartItem.title,
                price: existingCartItem.price,
                quantity: existingCartItem.quantity + 1
            ),
      );
    } else {
      _cartMap.putIfAbsent(
        productId,
            () =>
            Cart(
                id: DateTime.now().toString(),
                title: title,
                quantity: 1,
                price: price),
      );
    }
    notifyListeners();
  }

  void removeItemFromCart(String productId) {
    _cartMap.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _cartMap = {};
    notifyListeners();
  }


  void removeSingleCartItem(String productId) {
    if (_cartMap != null) {
      if (_cartMap.containsKey(productId)) {
        if (_cartMap[productId].quantity > 1) {
          _cartMap.update(
              productId, (value) =>
              Cart(id: value.id, title: value.title,
                  price: value.price,
                  quantity: value.quantity - 1));
              }else{
          _cartMap.remove(productId);
          }
              }else{
          return;
          }

          }
              notifyListeners();
        }
}
