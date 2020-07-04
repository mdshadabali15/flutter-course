import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart.dart';
import 'package:my_shop/providers/product_provider.dart';
import 'package:my_shop/screen/cart_screen.dart';
import 'package:my_shop/widgets/badge.dart';
import 'package:my_shop/widgets/drawer.dart';
import 'package:my_shop/widgets/product_grid.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
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


 /* Widget _floatingPanel(){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: Colors.grey,
            ),
          ]
      ),
      margin: const EdgeInsets.all(24.0),
      child: Center(
        child: Text("This is the SlidingUpPanel when open"),
      ),
    );
  }*/

  Widget _floatingPanel(CartProvider cartProvider){
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: Colors.grey,
            ),
          ]
      ),
      margin: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[

        Expanded(
          child: ListView.builder(
            //controller: myscrollController,
            itemBuilder: (context, index) {
              return CartDetails(
                  cartProvider.cartItemList.values.toList()[index],
                  cartProvider.cartItemList.keys.toList()[index]);
            },
            itemCount: cartProvider.cartCount(),
          ),
        ),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            Text(
              'Total',
              style: TextStyle(fontSize: 20),
            ),


    Text(
    'RS ${cartProvider.totalAmount()}',),

          ],)

      ],
      ),
    );
  }

 /* Widget _floatingCollapsed(){

    return CircleAvatar(
      backgroundColor: Colors.orange,
      radius: 1.0,
      child: Text('Cart'),
    );
  }*/


  Widget _floatingCollapsed(){

    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(Icons.linear_scale),
            Text('Cart'),
          ],

      ),
    );
  }
 /* Widget _floatingCollapsed(){
    return Container(

      decoration: BoxDecoration(
        color: Colors.blueGrey,
        //borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
       // shape: BoxShape.circle,

      ),
      margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      child: Center(
        child: Text(
          "This is the collapsed Widget",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }*/
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
        body: Stack(
            children: <Widget>[
           Column(children: <Widget>[
             if(cartProvider.cartItemList.isNotEmpty) SizedBox(height: 100,),
            _isProductLoading
                ? Center(
              child: CircularProgressIndicator(),
            ) : ProductGridWidget(isFavouriteSelected),

          /*  if(cartProvider.cartItemList.isNotEmpty) Container(
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
            ),*/
          ],
           ),
              if(cartProvider.cartItemList.isNotEmpty) Expanded(
                child: SlidingUpPanel(
                  footer: Icon(Icons.linear_scale) ,
                  slideDirection: SlideDirection.DOWN,
                  renderPanelSheet: false,
                  panel: _floatingPanel(cartProvider),
                  collapsed: _floatingCollapsed(),
                ),
              ),
        ],),
        drawer: DrawerWidget(),


    );
  }
}
