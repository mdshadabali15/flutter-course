import 'package:flutter/material.dart';
import 'package:my_shop/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const PRODUCT_DETAIL_SCREEN_ROUTE = '/product_detail_screen_route';

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context).settings.arguments as String;

    var loadedProduct =
        Provider.of<ProductProviders>(context, listen: false).findById(id);
    // String title = request['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Rs ${loadedProduct.price}',
              style: TextStyle(fontSize: 26),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                '${loadedProduct.description}',
                style: TextStyle(fontSize: 26),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
