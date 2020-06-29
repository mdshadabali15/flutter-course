import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart.dart';
import 'package:my_shop/providers/order.dart';
import 'package:my_shop/providers/product_provider.dart';
import 'package:my_shop/screen/Order_screen.dart';
import 'package:my_shop/screen/cart_screen.dart';
import 'package:my_shop/screen/edit_screen.dart';
import 'package:my_shop/screen/product_detail_screen.dart';
import 'package:my_shop/screen/product_overview_screen.dart';
import 'package:my_shop/screen/user_product_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyShop());

class MyShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductProviders(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => OrderProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: Scaffold(
          body: ProductOverviewScreen(),
        ),
        routes: {
          ProductDetailScreen.PRODUCT_DETAIL_SCREEN_ROUTE: (context) =>
              ProductDetailScreen(),
          CartScreen.CART_SCREEN_ROUTE: (context) => CartScreen(),
          OrderScreen.routName:(context)=>OrderScreen(),
          UserProductScreen.USER_PRODUCT_SCREEN_ROUTE : (context)=> UserProductScreen(),

          EditScreen.routeName: (context)=> EditScreen(),
        },
      ),
    );
  }
}
