import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_shop/modal/ProductModel.dart';
import 'package:my_shop/providers/product.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

class ProductProviders with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products {
    return [..._products];
  }

  Future<void> fetchProducts() async {

    var url = 'https://shop-app-f9b8b.firebaseio.com/product.json';

    try{
     final response = await http.get(url);

     if(response == null || response.body.isEmpty){
       return;
     }
     List<Product> productList = [];
     final extractData = json.decode(response.body) as Map<String,dynamic>;
     if(extractData ==null)
       return;
     extractData.forEach((productId, productMap) {
       productList.add(Product(
         id: productId,
         title: productMap['title'],
         imageUrl: productMap['imageUrl'],
         description: productMap['description'],
         price: productMap['price']
       ));
     });
     _products = productList;
     notifyListeners();

    }catch(error){

      log('Exception Occurred :{}'+error);

    }

  }
  List<Product> get favourites {
    return products.where((element) => element.isFavourite == true).toList();
  }

  void addProduct() {
    notifyListeners();
  }

  Product findById(String id) {
    return _products.firstWhere((element) => element.id == id);
  }

  void deleteProduct(String productId) {
    _products.removeWhere((product) => product.id == productId);
    notifyListeners();
  }

  Future<void> saveProduct(ProductModel productModel) {
    String  url = 'https://shop-app-f9b8b.firebaseio.com/product.json';
    return http
        .post(url,
            body: json.encode({
              'imageUrl': productModel.imageUrl,
              'title': productModel.title,
              'description': productModel.description,
              'price': productModel.price
            }))
        .then((value) {
      print(json.decode(value.body)['name']);
      _products.add(Product(
        id: json.decode(value.body)['name'],
        title: productModel.title,
        price: productModel.price,
        description: productModel.description,
        imageUrl: productModel.imageUrl,
      ));
      notifyListeners();
    }).catchError((error) {
      print(error);
      throw error;
    });
  }
}
