import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart.dart';
import 'package:provider/provider.dart';

class CartDetails extends StatelessWidget {
  final Cart cart;
  final String productId;

  CartDetails(this.cart, this.productId);

  @override
  Widget build(BuildContext context) {

    return Dismissible(
      direction: DismissDirection.endToStart,
      key: ValueKey(cart.id),
      onDismissed: (direction) {
        Provider.of<CartProvider>(context, listen: false)
            .removeItemFromCart(productId);
      },
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx){
            return AlertDialog(
              content: Text('you are about to delete item from cart'),
              title: Text('Are you sure?'),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  onPressed:(){
                    Navigator.of(context).pop(false);
                  } ,
                ),
                FlatButton(
                  child: Text('Yes'),
                  onPressed:(){
                    Navigator.of(context).pop(true);
                  } ,
                ),
              ],
            );
          }
        );
      },
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        padding: EdgeInsets.only(right: 20),
        // Used to shift delete icon
        alignment: Alignment.centerRight,
        // align delete icon at right form center
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 4),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 4),
        child: ListTile(
          leading: CircleAvatar(
            //radius: 70,
            child: FittedBox(
              child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Text('Rs ${cart.price * cart.quantity}')),
            ),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          title: Text(cart.title),
          subtitle: Text('Rs ${cart.price}'),
          trailing: Text('${cart.quantity} x'),
        ),
      ),
    );
  }
}
