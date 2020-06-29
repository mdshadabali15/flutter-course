import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier{

  final String id;
  final String imageUrl;
  final String title;
  final String description;
  final double price;
  bool isFavourite;

   Product({@required this.id, @required this.imageUrl, @required this.title, @required this.description, @required this.price,
   this.isFavourite= false});


   void toggleFavourite(){
     isFavourite = !isFavourite;
     String  url = 'https://shop-app-f9b8b.firebaseio.com/product/$id.json';
     //String json = '{"isFavourite":'+ isFavourite+'}';



     notifyListeners();
   }
}