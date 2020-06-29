import 'package:flutter/material.dart';
import 'package:my_shop/screen/Order_screen.dart';
import 'package:my_shop/screen/user_product_screen.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Welcome To Shop'),
          ),
          Divider(),
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.shop),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            title: Text(
              'Shop',
              style: TextStyle(fontSize: 24),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.payment),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(OrderScreen.routName);
              },
            ),
            title: Text(
              'Payment',
              style: TextStyle(fontSize: 24),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.edit),
              onPressed: (){
                Navigator.of(context).pushReplacementNamed(UserProductScreen.USER_PRODUCT_SCREEN_ROUTE);

              },
            ),
            title: Text(
              'Manage Product',
              style: TextStyle(fontSize: 24),
            ),
          )
        ],
      ),
    );
  }
}
