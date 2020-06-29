import 'package:flutter/material.dart';
import 'package:my_shop/providers/product.dart';
import 'package:my_shop/providers/product_provider.dart';
import 'package:my_shop/screen/edit_screen.dart';
import 'package:provider/provider.dart';

class UserProductWidget extends StatelessWidget {
  final Product product;

  UserProductWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(product.imageUrl)),
      title: Text(
        product.title,
        style: TextStyle(fontSize: 24),
      ),
      trailing: Container(
        width: 100,
        child: Row(children: <Widget>[

          IconButton(icon: Icon(Icons.edit,color: Colors.blue,),onPressed: (){
            Navigator.of(context).pushNamed(EditScreen.routeName);
            // pushName is used so that next page can be get by just clicking back button
          },),
          IconButton(icon: Icon(Icons.delete,color: Theme.of(context).errorColor),onPressed: (){
            Provider.of<ProductProviders>(context,listen: false).deleteProduct(product.id);
          },),

        ],),
      ),
    );
  }
}
