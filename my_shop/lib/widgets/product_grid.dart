import 'package:flutter/material.dart';
import 'package:my_shop/providers/product_provider.dart';
import 'package:my_shop/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductGridWidget extends StatelessWidget {

  final isFavouriteSelected ;
  ProductGridWidget(this.isFavouriteSelected);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProviders>(context);
    print(isFavouriteSelected);
    final productList = isFavouriteSelected ? productProvider.favourites : productProvider.products;

    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (ctx, index) =>
          ChangeNotifierProvider.value(
              value: productList[index], child: ProductItem()),
      itemCount: productList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10
      ),
    );
  }
}
