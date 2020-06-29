import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart.dart';
import 'package:my_shop/providers/order.dart';
import 'package:my_shop/widgets/cart_details_widget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const CART_SCREEN_ROUTE = '/cart_screen_route';

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Total',
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                    Chip(
                      backgroundColor: Theme.of(context).primaryColor,
                      label: Text(
                        'RS ${cartProvider.totalAmount()}',
                        style: TextStyle(
                            color:
                                Theme.of(context).primaryTextTheme.title.color),
                      ),
                    ),
                    FlatButton(
                      child: Text(
                        'Order Now',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      onPressed: () {
                        Provider.of<OrderProvider>(context, listen: false)
                            .placeOrder(cartProvider.cartItemList,
                                cartProvider.totalAmount());

                        cartProvider.clearCart();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CartDetails(
                    cartProvider.cartItemList.values.toList()[index],
                    cartProvider.cartItemList.keys.toList()[index]);
              },
              itemCount: cartProvider.cartCount(),
            ),
          )
        ],
      ),
    );
  }
}
