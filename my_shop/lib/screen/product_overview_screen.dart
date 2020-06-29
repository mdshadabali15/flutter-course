import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart.dart';
import 'package:my_shop/providers/product_provider.dart';
import 'package:my_shop/screen/cart_screen.dart';
import 'package:my_shop/widgets/badge.dart';
import 'package:my_shop/widgets/drawer.dart';
import 'package:my_shop/widgets/product_grid.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_details_widget.dart';

enum FilterOptions { Favourites, All }

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool isFavouriteSelected = false;

  var _init = false;
  var _isProductLoading = false;

  @override
  void didChangeDependencies() {
    if (!_init) {
      setState(() {
        _isProductLoading = true;
      });

      Provider.of<ProductProviders>(context).fetchProducts().then((_) {
        setState(() {
          _isProductLoading = false;
        });
      });
    }
    _init = true;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('My Shop'),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                //  print(selectedValue);
                if (selectedValue == FilterOptions.Favourites) {
                  setState(() {
                    isFavouriteSelected = true;
                  });
                } else {
                  setState(() {
                    isFavouriteSelected = false;
                  });
                }
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (context) =>
              [
                PopupMenuItem(
                  child: Text('Only Favourites'),
                  value: FilterOptions.Favourites,
                ),
                PopupMenuItem(
                  child: Text('Show All'),
                  value: FilterOptions.All,
                )
              ],
            ),
            Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                return Badge(
                  child: child,
                  value: cartProvider.cartCount().toString(),
                );
              },
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.CART_SCREEN_ROUTE);
                },
              ),
            )
          ],
        ),
        body: Column(children: <Widget>[
          _isProductLoading
              ? Center(
            child: CircularProgressIndicator(),
          ) : ProductGridWidget(isFavouriteSelected),
          if(cartProvider.cartItemList.isNotEmpty) Container(
            child: Expanded(

              child: DraggableScrollableSheet(
                expand: true,
                initialChildSize: 0.3,
                minChildSize: 0.0,
                maxChildSize: 0.8,
                builder: (BuildContext context, myscrollController) {
                  return Container(

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.black54),
                    ),

                    //color: Colors.grey,
                    child: ListView.builder(
                      controller: myscrollController,
                      itemBuilder: (context, index) {
                        return CartDetails(
                            cartProvider.cartItemList.values.toList()[index],
                            cartProvider.cartItemList.keys.toList()[index]);
                      },
                      itemCount: cartProvider.cartCount(),
                    )
                  );
                },
              ),
            ),
          ),
        ],),
        drawer: DrawerWidget(),


    );
  }
}
