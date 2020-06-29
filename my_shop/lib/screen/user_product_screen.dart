import 'package:flutter/material.dart';
import 'package:my_shop/providers/product_provider.dart';
import 'package:my_shop/screen/edit_screen.dart';
import 'package:my_shop/widgets/drawer.dart';
import 'package:my_shop/widgets/user_product_widget.dart';
import 'package:provider/provider.dart';

class UserProductScreen extends StatelessWidget {
  static const USER_PRODUCT_SCREEN_ROUTE = '/user_product_screen_route';


  Future<void> fetchProudcts (BuildContext context) async{
    await Provider.of<ProductProviders>(context).fetchProducts();
  }
  @override
  Widget build(BuildContext context) {
    ProductProviders productProviders = Provider.of<ProductProviders>(context);
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.of(context).pushNamed(EditScreen.routeName);
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () =>fetchProudcts(context),
        child: ListView.builder(
          itemBuilder: (context, index) =>
              UserProductWidget(productProviders.products[index]),
          itemCount: productProviders.products.length,
        ),
      ),
    );
  }
}
