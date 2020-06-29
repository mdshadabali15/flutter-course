

import 'package:flutter/foundation.dart';
import 'package:my_shop/providers/cart.dart';

class Order{
  
  final String id;
  final double total;
  final DateTime dateTime;
  final Map<String,Cart> cartItem;

  Order({@required this.dateTime,@required this.id, @required this.total, @required this.cartItem});
}

class OrderProvider with ChangeNotifier{

  List<Order> _orderList =[];

  List<Order> get  getOrderList{
    return [..._orderList];
  }

  void placeOrder(Map<String,Cart> cartItem, double total ){
    _orderList.insert(0, Order(id: DateTime.now().toString(),dateTime: DateTime.now(),cartItem: cartItem,total: total));
    notifyListeners();

  }

}